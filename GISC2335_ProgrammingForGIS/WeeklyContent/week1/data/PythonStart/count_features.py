import arcpy
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week1\data\PythonStart"
fc_list = arcpy.ListFeatureClasses()
for fc in fc_list:
    count = arcpy.management.GetCount(fc)
    print(count)
