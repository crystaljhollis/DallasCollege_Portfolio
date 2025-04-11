import arcpy
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week7\data\Ex06"
fc = "cities.shp"
newfc = "cities_copy.shp"
if arcpy.Exists(fc):
    arcpy.CopyFeatures_management(fc, newfc)
    