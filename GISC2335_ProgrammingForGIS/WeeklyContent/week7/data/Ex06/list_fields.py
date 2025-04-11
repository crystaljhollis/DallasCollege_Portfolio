import arcpy
arcpy.env.overwriteOutput = True
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week7\data\Ex06"
fieldlist = arcpy.ListFields("cities.shp")
for field in fieldlist:
    print(field.name + "" + field.type)
    