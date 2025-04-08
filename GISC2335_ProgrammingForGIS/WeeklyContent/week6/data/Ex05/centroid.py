import arcpy
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week6\data\Ex05"
arcpy.env.overwriteOutput = True # This is not in the lab instructions but I added this because I was getting an error since parks_centroid.shp already existed in my Ex05 folder.
in_fc = "parks.shp"
out_fc = "parks_centroid.shp"
if arcpy.ProductInfo() == "ArcInfo":
    arcpy.FeatureToPoint_management(in_fc, out_fc)
    print("Your System has the correct ArcGIS license installed. The Centroid Clip is in the Ex05 folder.") # Prints message confirming License and Clip Output.
else: print("An ArcInfo license is not available.")
