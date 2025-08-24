# hopeSupplyGeocodingPartners_REST.py
# Crystal Hollis | GISC 2335 – Programming for GIS
# Portfolio Project 1: Geocoding Hope Supply Co. Partner Agencies
# -------------------------------------------------------------------
"""
1) Verify ArcGIS Pro Python env & license
2) Prompt for workspace & partner Excel
3) Read sheet via pandas
4) Create output File GDB + point feature class
5) Loop rows: call REST API, parse JSON, insert point & fields
6) Summarize successes/failures
"""
# auto-install block
import sys, subprocess
def ensure_pkg(pkg_name):
    try:
        __import__(pkg_name)
    except ImportError:
        resp = input(f"Package '{pkg_name}' missing. Install now? (y/n): ").lower()
        if resp=="y":
            subprocess.check_call([sys.executable, "-m", "pip", "install", pkg_name])
        else:
            sys.exit(f"Cannot continue without '{pkg_name}'.")

for pkg in ("pandas","requests","numpy"):
    ensure_pkg(pkg)
    
import sys, os, tkinter as tk
from tkinter import filedialog, messagebox
import pandas as pd
import requests
import arcpy

# -----------------------------------------------------------------------------
# 1) ENVIRONMENT + LICENSE CHECK
# -----------------------------------------------------------------------------
root = tk.Tk(); root.withdraw()
if "arcgispro-py3" not in sys.executable.lower():
    messagebox.showerror("Wrong Interpreter",
        "Must run in ArcGIS Pro's arcgispro-py3 env or use the .bat launcher.")
    sys.exit(1)

arcpy.env.overwriteOutput = True
if arcpy.ProductInfo().lower() not in ("arcinfo","advanced"):
    messagebox.showerror("License Error",
        f"ArcInfo (Advanced) license required (found '{arcpy.ProductInfo()}').")
    sys.exit(1)

# -----------------------------------------------------------------------------
# 2) WORKSPACE & EXCEL SELECTION
# -----------------------------------------------------------------------------
messagebox.showinfo("Workspace", "Select output workspace folder")
work_dir = filedialog.askdirectory(title="Select Workspace")
if not work_dir:
    messagebox.showerror("No Folder", "No workspace selected. Exiting.")
    sys.exit(1)
arcpy.env.workspace = work_dir

messagebox.showinfo("Workbook", "Choose your partner Excel workbook")
excel_file = filedialog.askopenfilename(
    title="Select Excel Workbook",
    filetypes=[("Excel","*.xlsx;*.xls"),("All files","*.*")]
)
if not excel_file:
    messagebox.showerror("No File", "No workbook selected. Exiting.")
    sys.exit(1)

# -----------------------------------------------------------------------------
# 3) READ PARTNER LIST
# -----------------------------------------------------------------------------
# Auto‐detect sheet names
xls = pd.ExcelFile(excel_file)
sheet = xls.sheet_names[0]  # assume first sheet
df = pd.read_excel(excel_file, sheet_name=sheet, dtype=str).fillna("")
if df.empty:
    messagebox.showerror("No Data", "Partner sheet is empty. Exiting.")
    sys.exit(1)

# -----------------------------------------------------------------------------
# 4) PREPARE OUTPUT GDB + FC
# -----------------------------------------------------------------------------
gdb = os.path.join(work_dir, "GeocodeResults.gdb")
if not arcpy.Exists(gdb):
    arcpy.CreateFileGDB_management(work_dir, "GeocodeResults.gdb")

out_fc = os.path.join(gdb, "HopePartners_Geocoded")
sr = arcpy.SpatialReference(4326)  # WGS84

# Remove if exists
if arcpy.Exists(out_fc):
    arcpy.Delete_management(out_fc)

# Create point feature class
arcpy.CreateFeatureclass_management(
    os.path.dirname(out_fc), os.path.basename(out_fc),
    "POINT", spatial_reference=sr
)

# Add attribute fields
fields = [
    ("PartnerName", "TEXT", 255),
    ("MatchedAddr", "TEXT", 255),
    ("Score",       "SHORT", None),
]
for name, typ, length in fields:
    arcpy.AddField_management(out_fc, name, typ, field_length=length or 0)

# -----------------------------------------------------------------------------
# 5) GEOCODE VIA REST + INSERT
# -----------------------------------------------------------------------------
locator_url = "https://geocode.arcgis.com/arcgis/rest/services/World/GeocodeServer/findAddressCandidates"
insert_fields = ["SHAPE@XY","PartnerName","MatchedAddr","Score"]

success, failed = 0, 0
with arcpy.da.InsertCursor(out_fc, insert_fields) as ic:
    for idx, row in df.iterrows():
        name = row.get("PartnerName","").strip()
        if not name:
            failed += 1
            continue

        # Build REST request
        params = {
            "SingleLine": name,
            "f": "json",
            "maxLocations": 1,
            "outFields": "Match_addr,Score"
        }
        try:
            resp = requests.get(locator_url, params=params, timeout=10)
            resp.raise_for_status()
            data = resp.json()
            candidates = data.get("candidates", [])
            if not candidates:
                failed += 1
                continue

            cand = candidates[0]
            loc = cand["location"]
            x, y = loc["x"], loc["y"]
            matched = cand["address"]
            score   = int(cand.get("score", 0))

            ic.insertRow([(x,y), name, matched, score])
            success += 1

        except Exception as ex:
            failed += 1
            print(f"[ERROR] {name}: {ex}")  # also prints to console

# -----------------------------------------------------------------------------
# 6) FINISH UP
# -----------------------------------------------------------------------------
messagebox.showinfo(
    "Done",
    f"Geocoded {success} addresses successfully.\n"
    f"Failed to geocode {failed} addresses.\n\n"
    f"Results in:\n{out_fc}"
)
root.destroy()
