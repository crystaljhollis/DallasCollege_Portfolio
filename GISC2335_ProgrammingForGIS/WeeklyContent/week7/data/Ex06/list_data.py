import arcpy
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week7\data\Ex06"
fclist = arcpy.ListFeatureClasses()
for fc in fclist:
    fcdesc = arcpy.da.Describe(fc)
    dtype = fcdesc["dataType"]
    name = fcdesc["name"]
    stype = fcdesc["shapeType"]
    print(f"{dtype} {name} has shapetype {stype}")
    