import arcpy
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week12\data\Ex09"
fc = "hawaii.shp"
with arcpy.da.SearchCursor(fc, ["OID@", "SHAPE@"]) as cursor:
    for row in cursor:
        print("Feature {0}: ".format(row[0]))
        partnum = 0
        for part in row[1]:
            print("Part {0}: ".format(partnum))
            for point in part:
                print("{0:.2f}, {1:.2f}".format(point.X, point.Y))
                partnum += 1
