import arcpy
from arcpy.sa import *
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week13\data\Ex10"
# STEP 7
myremap = RemapValue([[41,1], [42,2], [43,3]])
outreclass = Reclassify("landcover.tif", "VALUE", myremap, "NODATA")
outreclass.save("lc_recl")


# STEP 2
#myremap = RemapRange([[1000,2000,1], [2000,3000,2], [3000,4000,3]])
#outreclass = Reclassify("elevation", "VALUE", myremap)
#outreclass.save("elev_recl")
