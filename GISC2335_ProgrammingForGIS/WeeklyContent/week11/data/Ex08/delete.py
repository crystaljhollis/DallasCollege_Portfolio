import arcpy
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week11\data\Ex08"
fc = "airports.shp"
with arcpy.da.UpdateCursor(fc, ["TOT_ENP"]) as cursor:
    for row in cursor:
        if row[0] < 100000:
            cursor.deleteRow()
            