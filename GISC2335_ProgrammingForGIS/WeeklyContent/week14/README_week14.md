Here is a **README for Week 15 – Lab 11: Map Scripting**, styled to match your previous week's format:

---

## **Week 15 – Lab 11: Map Scripting**

📦 **Package Links:** 

[Lab 11 Package: Austin.aprx (ArcGIS Online)](https://arcg.is/1mHLbn0)
[Lab 11 Package: Austin_County.aprx (ArcGIS Online)](https://arcg.is/D1G5y0)
[Lab 11 Package: Austin_Canvas.aprx (ArcGIS Online)](https://arcg.is/0zu98n0)
[Lab 11 Package: Austin_Symbology.aprx (ArcGIS Online)](https://arcg.is/1Lz8150)

---

This lab focused on automating map manipulation and layout tasks using the `arcpy.mp` module in ArcGIS Pro. The exercises demonstrated how to programmatically access `.aprx` project files, manipulate maps and layers, modify basemaps, and update symbology with Python scripts.

💡 **Key Concepts Covered:**

* Referencing ArcGIS Pro projects via `ArcGISProject()`
* Saving projects with `saveACopy()` to avoid overwriting originals
* Listing and renaming maps using `listMaps()` and modifying `Map.name`
* Accessing layers using `listLayers()` and determining types via `isFeatureLayer`, `isBasemapLayer`
* Modifying basemaps with `addBasemap()`
* Editing feature layer symbology using `Layer.symbology` and `renderer.symbol.color`
* Cleaning up project locks with `del aprx`

🛠️ **Tools Used:**

* ArcGIS Pro
* ArcPy (Map scripting via `arcpy.mp`)
* Python 3.x (via IDLE)
* `ArcGISProject`, `Map`, and `Layer` objects

📝 **Common Issues Encountered and Solutions:**

* ❌ **Error using "CURRENT" outside ArcGIS Pro**

  * ✅ **Fix:** Use a full or relative path to the `.aprx` file instead of `"CURRENT"`
* ❌ **Project remains locked after script runs**

  * ✅ **Fix:** Use `del aprx` to release memory reference and unlock file
* ❌ **Layer symbology update fails silently**

  * ✅ **Fix:** Ensure the layer is a feature layer and has a supported renderer (check with `hasattr(sym, "renderer")`)
* ❌ **Script doesn't find `.aprx` file**

  * ✅ **Fix:** Double-check working directory or use absolute path

📄 **Scripts Included:**

* `projects.py`: Opens a project, prints the default geodatabase path
* `list_maps.py`: Lists all maps in a project and prints map units
* `rename_map.py`: Renames the "Region" map to "County" and saves as a new project
* `work_layers.py`: Lists layers in each map and identifies their types
* `change_basemap.py`: Replaces the basemap with "Light Gray Canvas"
* `layer_symbology.py`: Modifies the fill color of a polygon feature layer

