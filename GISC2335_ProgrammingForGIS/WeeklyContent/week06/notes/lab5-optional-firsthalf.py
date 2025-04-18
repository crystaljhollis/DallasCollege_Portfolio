# coding: utf-8
arcpy.Clip_analysis("parks", "zip", r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week6\data\Ex05\parks_clip.shp")
# <Result 'C:\\ProgrammingProjects\\GISC2335_ProgrammingForGIS\\WeeklyContent\\week6\\data\\Ex05\\parks_clip.shp'>
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week6\data\Ex05"
arcpy.Buffer_analysis("facilities.shp", "facilities_buffer.shp", "500 METERS")
# <Result 'C:\\ProgrammingProjects\\GISC2335_ProgrammingForGIS\\WeeklyContent\\week6\\data\\Ex05\\facilities_buffer.shp'>
arcpy.Buffer_analysis("facilities.shp", "facilities_buffer.shp", "500 METERS", "","","ALL")
# <Result 'C:\\ProgrammingProjects\\GISC2335_ProgrammingForGIS\\WeeklyContent\\week6\\data\\Ex05\\facilities_buffer.shp'>
arcpy.Buffer_analysis("facilities.shp", "facilities_buffer.shp", "500 METERS", "", "", "ALL")
# <Result 'C:\\ProgrammingProjects\\GISC2335_ProgrammingForGIS\\WeeklyContent\\week6\\data\\Ex05\\facilities_buffer.shp'>
arcpy.env.overwriteOutput = True
arcpy.Buffer_analysis("facilities.shp", "facilities_buffer.shp", "500 METERS", "", "", "ALL")
# <Result 'C:\\ProgrammingProjects\\GISC2335_ProgrammingForGIS\\WeeklyContent\\week6\\data\\Ex05\\facilities_buffer.shp'>
arcpy.Buffer_analysis("facilities.shp", "facilities_buffer.shp", "500 METERS", "", "", "ALL")
# <Result 'C:\\ProgrammingProjects\\GISC2335_ProgrammingForGIS\\WeeklyContent\\week6\\data\\Ex05\\facilities_buffer.shp'>
arcpy.Buffer_analysis(
    "facilities.shp",
    "facilities_buffer_dissolved.shp",
    "500 METERS",
    "", "", "ALL"
)
arcpy.Buffer_analysis("facilities.shp", "facilities_buffer.shp", "500 METERS", "", "", "all")
# <Result 'C:\\ProgrammingProjects\\GISC2335_ProgrammingForGIS\\WeeklyContent\\week6\\data\\Ex05\\facilities_buffer.shp'>
in_features = "bike_routes.shp"
clip_features = "zip.shp"
out_features = "bike_clip.shp"
xy_tolerance = ""
arcpy.Clip_analysis(in_features, clip_features, out_features, xy_tolerance)
# <Result 'C:\\ProgrammingProjects\\GISC2335_ProgrammingForGIS\\WeeklyContent\\week6\\data\\Ex05\\bike_clip.shp'>
arcpy.Exists("hospitals.shp")
# False
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week6\data\Ex05"
arcpy.Exists("hospitals.shp")
# True
arcpy.Usage("Clip_analysis")
# 'Clip_analysis(in_features, clip_features, out_feature_class, {cluster_tolerance})'
arcpy.Usage("Clip")
# 'Method Clip not found. Choices: Method Clip not unique, please use ToolboxName_ToolName.'
arcpy.Usage("Exists")
# 'exists(<dataset>, {datatype}) -> boolean\nCheck if a data element exists.'
prjfile = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week6\data\Ex05\facilities.prj"
spatial_ref = arcpy.SpatialReference(prjfile)
arcpy.DefineProjection_management("hospitals", spatial_ref)
# <Result 'hospitals'>
print(spatial_ref.name)
# NAD_1983_StatePlane_Texas_Central_FIPS_4203_Feet
print(spatial_ref.linearUnitName)
# Foot_US
print(spatial_ref.XYResolution)
# 0.0003280833333333333
arcpy.env.overwriteOutput = True
arcpy.env.outputCoordinateSystem = spatial_ref
print(arcpy.env.workspace)
# C:\Users\CrystalHollis\AppData\Local\Temp\ArcGISProTemp37896\Untitled\Default.gdb
arcpy.env.workspace = r"C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week6\data\Ex05"
print(arcpy.env.workspace)
# C:\ProgrammingProjects\GISC2335_ProgrammingForGIS\WeeklyContent\week6\data\Ex05
print(arcpy.env.outputCoordinateSystem.name)
# NAD_1983_StatePlane_Texas_Central_FIPS_4203_Feet
arcpy.ClearEnvironment("workspace")
print(arcpy.env.workspace)
# C:\Users\CrystalHollis\AppData\Local\Temp\ArcGISProTemp37896\Untitled\Default.gdb
arcpy.ResetEnvironments()
print(arcpy.env.outputCoordinateSystem)
# None
