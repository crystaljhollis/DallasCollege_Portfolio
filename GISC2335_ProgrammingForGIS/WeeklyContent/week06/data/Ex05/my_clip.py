import arcpy
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week6\data\Ex05"
arcpy.env.overwriteOutput = True
newclip = arcpy.Clip_analysis("bike_routes.shp", "parks.shp", "bike_clip.shp")
fcount = arcpy.GetCount_management("bike_clip.shp")
msgCount = newclip.messageCount
print(newclip.getMessage(msgCount-1))


