import arcpy
import os
ws = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week7\data\Ex06"
fgdb = "Copy.gdb"
arcpy.CreateFileGDB_management(ws, fgdb)
arcpy.env.workspace = ws
fclist = arcpy.ListFeatureClasses()
for fc in fclist:
    fcname = arcpy.da.Describe(fc)["baseName"] 
    newfc = os.path.join(ws, fgdb, fcname)
    arcpy.CopyFeatures_management(fc, newfc)
    