import arcpy
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week11\data\Ex08"
fc = "airports.shp"
delimfield = arcpy.AddFieldDelimiters(fc, "STATE")
sql_exp = delimfield + " <> 'AK'"
with arcpy.da.UpdateCursor(fc, ["STATE"], sql_exp) as cursor:
    for row in cursor:
        row[0] = "AK"
        cursor.updateRow(row)
        