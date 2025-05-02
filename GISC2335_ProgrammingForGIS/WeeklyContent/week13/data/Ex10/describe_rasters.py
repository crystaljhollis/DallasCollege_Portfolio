import arcpy
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week13\data\Ex10"
raster = "tm.img"
desc = arcpy.da.Describe(raster)
print("Raster base name: {0}".format(desc["baseName"]))
print("Raster data type: " + desc["dataType"])
print("Raster file extension: " + desc["extension"])
