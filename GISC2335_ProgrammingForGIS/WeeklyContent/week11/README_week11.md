## **Week 11 – Lab 8: Manipulating Spatial and Tabular Data**

📦 **Package Link:** *[https://arcg.is/1qfyXy2]*

---

This lab focuses on using ArcPy to explore and manipulate spatial and tabular data in a GIS environment. I practiced using search, update, and insert cursors in Python to query, modify, and create feature class records. The lab also introduced SQL expressions for feature selection and emphasized proper handling of field names when working with shapefiles and geodatabases.

💡 **Key Concepts Covered:**
- Using `SearchCursor`, `UpdateCursor`, and `InsertCursor` to access and manipulate feature attributes
- Building SQL expressions for attribute selection in scripts
- Selecting features and exporting them to a new shapefile using `Select_analysis()`
- Updating and deleting records conditionally based on field values
- Inserting new records into a shapefile
- Validating and safely adding new fields using `ValidateFieldName()` and `ListFields()`
- Preventing file overwrite by generating unique output names with `CreateUniqueName()`
- Understanding common errors like schema locks and module conflicts (e.g., misnaming scripts as `select.py`)

🛠️ **Tools Used:**
- ArcGIS Pro
- ArcPy (via `arcgispro-py3` environment)
- Visual Studio Code

📝 **Common Issues Encountered and Solutions:**
- ❌ **AttributeError: 'arcpy' has no attribute 'AddFieldDelimiters'**
  - ✅ **Fix:** Avoid naming your script `select.py` or using names that clash with standard Python or ArcPy modules. Rename the script and delete `__pycache__`.
- ❌ **Schema lock errors (000464) when editing shapefiles**
  - ✅ **Fix:** Close ArcGIS Pro before running scripts that modify feature classes.



