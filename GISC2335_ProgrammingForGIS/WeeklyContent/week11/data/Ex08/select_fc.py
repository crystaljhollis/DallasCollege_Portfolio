# Number 8 on the Python_Scripting_08.pdf lab instructions. "Save the existing sql.py script as select.py to the filepath\EX08 folder."
# This is renamed because "Select.py" conflicts with Python's built-in select module used in networking.
import arcpy
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week11\data\Ex08"
infc = "airports.shp"
outfc = "airports_anchorage.shp"
delim_field = arcpy.AddFieldDelimiters(infc, "COUNTY")
sql_exp = delim_field + " = 'Anchorage Borough'"
arcpy.Select_analysis(infc, outfc, sql_exp)
