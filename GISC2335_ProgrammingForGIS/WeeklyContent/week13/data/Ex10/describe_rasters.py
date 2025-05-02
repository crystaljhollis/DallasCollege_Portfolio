import arcpy
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week13\data\Ex10"
raster = "tm.img"
desc = arcpy.da.Describe(raster)
# STEP 12
for rband in desc["children"]:
    bandname = rband["baseName"]
    x = rband["meanCellHeight"]
    y = rband["meanCellWidth"]
    spatialref = desc["spatialReference"]
    units = spatialref.angularUnitName
    print("The resolution of {0} is {1:.7f} by {2:.7f} {3}." .format(bandname, x, y, units))


# STEP 8
# x = desc["meanCellHeight"]
# y = desc["meanCellWidth"]
# spatialref = desc["spatialReference"]
# units = spatialref.linearUnitName
# print("The raster resolution is {0} by {1} {2}.".format(x, y, units))

# STEP 3
#print("Raster base name: {0}".format(desc["baseName"]))
#print("Raster data type: " + desc["dataType"])
#print("Raster file extension: " + desc["extension"])
# STEP 4
#print("Raster spatial reference: " + desc["spatialReference"].name)
#print("Raster format: " + desc["format"])
#print("Raster compression: " + desc["compressionType"])
#print("Raster number of bands: " + str(desc["bandCount"]))
