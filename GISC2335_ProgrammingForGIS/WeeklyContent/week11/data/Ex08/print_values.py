import arcpy
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week11\data\Ex08"
fc = "airports.shp"
cursor = arcpy.da.SearchCursor(fc, ["NAME"])
for row in cursor:
    print("Airport name = {0}".format(row[0]))
