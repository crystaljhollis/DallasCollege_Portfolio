import arcpy
# Set workspace
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week4\data\Ex03\Study.gdb"

# Run the Clip tool
arcpy.Clip_analysis("lakes", "basin", "lakes_myClip")