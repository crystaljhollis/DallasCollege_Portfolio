import arcpy
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week13\data\Ex10"
rasterlist = arcpy.ListRasters()
for raster in rasterlist:
    print(raster)
    