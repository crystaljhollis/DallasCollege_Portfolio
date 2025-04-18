import arcpy
arcpy.env.workspace = "C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week10\data\Ex07"
fclist = arcpy.ListFeatureClasses()
for fc in fclist:
    desc = arcpy.da.Describe(fc)
    print(f'{desc["baseName"]}: {desc["shapeType"]}')
