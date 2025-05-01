import arcpy
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week12\data\Ex09"
fc = "dams.shp"
with arcpy.da.SearchCursor(fc, ["SHAPE@XY"]) as cursor:
    for row in cursor:
        x, y = row[0]
        print("{0:.3f}, {1:.3f}".format(x, y))
        