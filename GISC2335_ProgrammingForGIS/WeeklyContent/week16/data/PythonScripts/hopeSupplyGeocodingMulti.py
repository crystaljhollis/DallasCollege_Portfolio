# hopeSupplyGeocodingMulti.py
# Crystal Hollis | GISC 2335 – Programming for GIS
# Portfolio Project 2: Append Multi-Location Geocodes into “final” Feature Class

"""
1) Verify ArcGIS Pro Python env & ArcInfo license
2) Prompt for workspace & partner Excel
3) Read & unpivot multiple address columns via pandas
4) Build in_memory table, geocode via REST, then
   • Copy original HopePartners_Geocoded → HopePartners_Final
   • Append new location points into HopePartners_Final
5) Report successes/failures and final output path
"""

import sys, os, tkinter as tk
from tkinter import filedialog, simpledialog, messagebox

# -------------------------------------------------------------------
# 1) ENVIRONMENT & LICENSE CHECK
# -------------------------------------------------------------------
root = tk.Tk(); root.withdraw()

if "arcgispro-py3" not in sys.executable.lower():
    messagebox.showerror(
        "Wrong Interpreter",
        "Run in ArcGIS Pro’s 'arcgispro-py3' environment or use the .bat launcher."
    )
    sys.exit(1)

import arcpy
arcpy.env.overwriteOutput = True
if arcpy.ProductInfo().lower() not in ("arcinfo","advanced"):
    messagebox.showerror(
        "License Error",
        f"ArcInfo license required (found '{arcpy.ProductInfo()}')."
    )
    sys.exit(1)

# -------------------------------------------------------------------
# 2) WORKSPACE SELECTION
# -------------------------------------------------------------------
messagebox.showinfo("Workspace", "Select the folder where your GDB lives or will be created.")
work_dir = filedialog.askdirectory(title="Select Workspace")
if not work_dir:
    messagebox.showerror("No Folder", "No workspace selected. Exiting.")
    sys.exit(1)
arcpy.env.workspace = work_dir

# -------------------------------------------------------------------
# 3) EXCEL WORKBOOK & SHEET NAME
# -------------------------------------------------------------------
messagebox.showinfo("Workbook", "Choose your partner Excel workbook.")
excel_file = filedialog.askopenfilename(
    title="Select Excel Workbook",
    filetypes=[("Excel","*.xlsx;*.xls"),("All files","*.*")]
)
if not excel_file:
    messagebox.showerror("No File", "Exiting.")
    sys.exit(1)

import pandas as pd
xls    = pd.ExcelFile(excel_file)
sheets = xls.sheet_names
sheet  = sheets[0] if len(sheets)==1 else simpledialog.askstring(
    "Sheet Name",
    f"Available sheets:\n{', '.join(sheets)}\n\nType exact name:",
    initialvalue=sheets[0]
)
if sheet not in sheets:
    messagebox.showerror("Invalid Sheet", "Exiting.")
    sys.exit(1)

# -------------------------------------------------------------------
# 4) READ & UNPIVOT ADDRESS COLUMNS
# -------------------------------------------------------------------
df = pd.read_excel(excel_file, sheet_name=sheet, dtype=str).fillna("")

# prompt for which columns contain addresses
cols_str = ", ".join(df.columns)
addr_cols = simpledialog.askstring(
    "Address Columns",
    f"Your fields:\n{cols_str}\n\nEnter comma-separated address columns:",
    initialvalue="PartnerAddress"
)
if not addr_cols:
    messagebox.showerror("No Columns", "Exiting.")
    sys.exit(1)
addr_cols = [c.strip() for c in addr_cols.split(",") if c.strip()]

# melt/unpivot
id_vars = [c for c in df.columns if c not in addr_cols]
melted  = df.melt(id_vars=id_vars, value_vars=addr_cols,
                  var_name="AddrField", value_name="SingleLine")
melted  = melted[melted["SingleLine"].str.strip().astype(bool)].reset_index(drop=True)
if melted.empty:
    messagebox.showerror("No Addresses", "No non-blank addresses. Exiting.")
    sys.exit(1)

# -------------------------------------------------------------------
# 5) PANDAS → NUMPY → IN_MEMORY TABLE
# -------------------------------------------------------------------
import numpy as np
dtype = []
for col in melted.columns:
    maxlen = melted[col].map(len).max() or 1
    dtype.append((col, f'U{maxlen}'))

records = [tuple(r) for r in melted.itertuples(index=False, name=None)]
try:
    arr = np.array(records, dtype=dtype)
    arcpy.da.NumPyArrayToTable(arr, r"in_memory\addr_table")
except Exception as e:
    messagebox.showerror("Table Error", f"Failed to load in_memory table:\n{e}")
    sys.exit(1)

# -------------------------------------------------------------------
# 6) PREPARE FINAL FEATURE CLASS
# -------------------------------------------------------------------
gdb_path   = os.path.join(work_dir, "GeocodeResults.gdb")
orig_fc    = os.path.join(gdb_path, "HopePartners_Geocoded")
final_fc   = os.path.join(gdb_path, "HopePartners_Final")

if not arcpy.Exists(gdb_path):
    arcpy.CreateFileGDB_management(work_dir, "GeocodeResults.gdb")
if not arcpy.Exists(orig_fc):
    messagebox.showerror("Missing FC", f"Cannot find original:\n{orig_fc}")
    sys.exit(1)

# copy original → final (overwrite if exists)
if arcpy.Exists(final_fc):
    arcpy.Delete_management(final_fc)
arcpy.CopyFeatures_management(orig_fc, final_fc)

# -------------------------------------------------------------------
# 7) REST GEOCODING & APPEND
# -------------------------------------------------------------------
import requests
locator_url = (
    "https://geocode.arcgis.com/arcgis/rest/services/"
    "World/GeocodeServer/findAddressCandidates"
)

# prepare insert cursor fields: SHAPE@XY + all source cols + Score + Match_addr
insert_fields = ["SHAPE@XY"] + list(melted.columns) + ["Score","Match_addr"]
success, failed = 0, 0

with arcpy.da.InsertCursor(final_fc, insert_fields) as ic:
    for rec in melted.itertuples(index=False, name=None):
        single = rec[melted.columns.get_loc("SingleLine")]
        params = {
            "SingleLine": single,
            "f": "json",
            "maxLocations": 1,
            "outFields": "Match_addr,Score"
        }
        try:
            r = requests.get(locator_url, params=params, timeout=10)
            r.raise_for_status()
            cands = r.json().get("candidates", [])
            if not cands:
                failed += 1
                continue
            c0     = cands[0]
            x,y    = c0["location"]["x"], c0["location"]["y"]
            score  = str(int(c0.get("score",0)))
            match  = c0.get("address","")
            ic.insertRow([(x,y)] + list(rec) + [score, match])
            success += 1
        except Exception:
            failed += 1

# -------------------------------------------------------------------
# 8) FINISHED
# -------------------------------------------------------------------
messagebox.showinfo(
    "All Done",
    f"Appended {success} new locations.\n"
    f"Failed to geocode {failed} records.\n\n"
    f"Final FC:\n{final_fc}"
)
root.destroy()
