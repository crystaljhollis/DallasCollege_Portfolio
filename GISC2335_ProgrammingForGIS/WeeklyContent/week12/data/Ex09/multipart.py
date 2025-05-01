import arcpy
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week12\data\Ex09"
fc = "hawaii.shp"
with arcpy.da.SearchCursor(fc, ["OID@", "SHAPE@"]) as cursor:
    for row in cursor:
        if row[1].isMultipart:
            print("Feature {0} is multipart and has {1} " "parts.".format(row[0], str(row[1].partCount)))
        else:
            print("Feature {0} is single part.".format(row[0]))
