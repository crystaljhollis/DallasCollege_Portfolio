import arcpy
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week11\data\Ex08"
fc = "airports.shp"
delim_field = arcpy.AddFieldDelimiters(fc, "COUNTY")
sql_exp = delim_field + " = 'Anchorage Borough'"
cursor = arcpy.da.SearchCursor(fc, ["NAME"], sql_exp)
for row in cursor:
    print(row[0])
