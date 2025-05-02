import arcpy
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week13\data\Ex10"
outraster = arcpy.sa.Slope("elevation")
outraster.save("slope") # STEP 6




# STEP 4
# desc = arcpy.da.Describe(outraster)
# print(desc["datasetType"])
# print(desc["permanent"])
