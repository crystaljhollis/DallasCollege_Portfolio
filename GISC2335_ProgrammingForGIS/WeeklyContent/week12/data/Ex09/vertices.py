import arcpy
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week12\data\Ex09"
fc = "rivers.shp"
with arcpy.da.SearchCursor(fc, (["OID@", "SHAPE@"])) as cursor:
    for row in cursor:
        print("Feature {0}: ".format(row[0]))
        for point in row[1].getPart(0):
            print("{0:.3f}, {1:.3f}".format(point.X, point.Y))
            