## **Week 6: Chapter 5 – Geoprocessing Using Python**

### **Assignment Description**

This lab expands on Chapter 5: **Geoprocessing Using Python**, focusing on the use of ArcPy within the ArcGIS Pro Python window and in stand-alone Python scripts. You'll run tools programmatically, configure environment settings, manage licensing, and retrieve tool messages using Python.

💡 **Key Concepts Covered:**
- Running geoprocessing tools (e.g., `Clip_analysis`, `Buffer_analysis`) using ArcPy
- Setting the workspace and controlling environment properties like output coordinate system
- Using variables for flexible tool input/output
- Dissolving buffer results via tool parameters
- Retrieving tool messages using `arcpy.GetMessages()` and `Result` objects
- Understanding and applying ArcPy functions (`Exists()`, `Usage()`)
- Using the `SpatialReference` class to define coordinate systems
- Managing licenses with `CheckProduct()` and `CheckExtension()`
- Writing conditional logic based on license availability

---

### **Deliverables**

- A Python script file (`my_clip.py`) demonstrating:
  - Workspace setup
  - Execution of `Clip_analysis`
  - Retrieval of tool messages
- Optional script: `centroid.py` demonstrating license checking before running tools
- Output shapefiles such as `parks_clip.shp`, `bike_clip.shp`, `facilities_buffer.shp`, and `parks_centroid.shp`
- Demonstrations of environment control, such as:
  - `arcpy.env.overwriteOutput = True`
  - `arcpy.env.outputCoordinateSystem = spatial_ref`