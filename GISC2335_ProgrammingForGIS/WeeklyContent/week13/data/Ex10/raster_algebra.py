import arcpy
from arcpy.sa import *
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week13\data\Ex10"
elevraster = arcpy.Raster("elevation")
slope = AspectSlope(elevraster)
goodslope = slope < 20
goodelev = elevraster < 2500
goodfinal = goodslope & goodelev
goodfinal.save("final")


# STEP 3
#outraster = elevraster * 3.281
#outraster.save("elev_ft")
