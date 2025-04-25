import arcpy
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week11\data\Ex08"
fc = "airports.shp"
with arcpy.da.InsertCursor(fc, "NAME") as cursor:
    cursor.insertRow(["New Airport"])
    