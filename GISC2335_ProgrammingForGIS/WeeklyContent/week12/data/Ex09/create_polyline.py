import arcpy
import fileinput
import os
ws = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week12\data\Ex09"
arcpy.env.workspace = ws
arcpy.env.overwriteOutput = True
newfc = "newpolyline.shp"

# Write geometries STEP 5: 
# The code from the lab instructions show an error because it is passing 
# a string file name (“dams.prj”) to the spatial_reference parameter. 
# Spatial_reference expects a SpatialReference object, not a string. 
# code from lab instructions: arcpy.CreateFeatureclass_management(ws, newfc, "Polyline", spatial_reference = "dams.prj")
# Relevant Error messages: 
# ERROR 000622: Failed to execute (Create Feature Class). Parameters are not valid.
# ERROR 000628: Cannot set input into parameter spatial_reference.

# Below is are corrections:
# Load the .prj file using arcpy.SpatialReference()
sr = arcpy.SpatialReference(os.path.join(ws, "dams.prj"))
# Create new empty polyline feature class with same spatial reference as dams.shp
arcpy.CreateFeatureclass_management(ws, newfc, "Polyline", spatial_reference=sr)

infile = os.path.join(ws, "coordinates.txt") # Coordinates will be used to create the vertices for a polyline
with arcpy.da.InsertCursor(newfc, ["SHAPE@"]) as cursor:
    array = arcpy.Array()
    for line in fileinput.input(infile):
        ID, X, Y = line.split()
        array.add(arcpy.Point(X, Y))
    cursor.insertRow([arcpy.Polyline(array)])
    fileinput.close()