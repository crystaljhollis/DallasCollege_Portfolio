import arcpy
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week11\data\Ex08"
infc = "airports.shp"
outfc = "airports_anchorage.shp"
delim_field = arcpy.AddFieldDelimiters(infc, "COUNTY")
sql_exp = delim_field + " = 'Anchorage Borough'"
arcpy.Select_analysis(infc, outfc, sql_exp)
