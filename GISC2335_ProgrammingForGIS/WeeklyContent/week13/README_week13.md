## **Week 14 – Lab 10: Working with Rasters**

📦 **Package Link:** *[To be added later ]*

---

This lab focused on automating raster data processing using Python and ArcPy in ArcGIS Pro. I explored how to list, describe, analyze, and reclassify raster datasets using both built-in ArcPy functions and map algebra operators. The lab emphasized the importance of temporary vs. permanent raster outputs and demonstrated how to script raster geoprocessing workflows efficiently.

💡 **Key Concepts Covered:**
- Listing rasters in a workspace with `ListRasters()`
- Describing raster metadata (e.g., format, resolution, band count) using `arcpy.da.Describe()`
- Handling differences between single-band and multi-band rasters
- Using `children` to iterate over bands in multiband rasters
- Performing raster analysis using `arcpy.sa` (e.g., `Slope`, `AspectSlope`, map algebra)
- Saving temporary raster objects to disk with `.save()`
- Reclassifying continuous and categorical data using `RemapRange` and `RemapValue`

🛠️ **Tools Used:**
- ArcGIS Pro
- ArcPy (with Spatial Analyst extension)
- Python 3.x (via IDLE)
- `arcpy.sa` module (Spatial Analyst)
- Map Algebra Operators (`+`, `-`, `*`, `<`, `&`, etc.)

📝 **Common Issues Encountered and Solutions:**
- ❌ **KeyError: 'meanCellHeight'** when describing `tm.img`
  - ✅ **Fix:** Used the `children` property to access band-specific properties in multiband rasters
- ❌ **Temporary raster not found after script finishes**
  - ✅ **Fix:** Used `.save("filename")` to persist the raster to disk
- ❌ **Unexpected results in reclassification**
  - ✅ **Fix:** Verified remap table values and parameter order in `Reclassify()` function

📄 **Scripts Included:**
- `list_rasters.py`: Lists all rasters in the workspace
- `describe_rasters.py`: Prints properties of single- and multi-band rasters
- `raster_objects.py`: Generates slope raster and saves it
- `raster_algebra.py`: Uses map algebra to convert elevation and filter values
- `reclass.py`: Reclassifies elevation with `RemapRange`, and landcover with `RemapValue`
