import arcpy
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week12\data\Ex09"
fc = "rivers.shp"
with arcpy.da.SearchCursor(fc, ["SHAPE@LENGTH"]) as cursor:
    length = 0
    for row in cursor:
        length = length + row[0]
    print(length)
    