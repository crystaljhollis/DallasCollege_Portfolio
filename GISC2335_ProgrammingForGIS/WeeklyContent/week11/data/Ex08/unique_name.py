import arcpy
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week11\data\Ex08"
fc = "airports.shp"
unique_name = arcpy.CreateUniqueName("buffer.shp")
arcpy.Buffer_analysis(fc, unique_name, "5000 METERS")
