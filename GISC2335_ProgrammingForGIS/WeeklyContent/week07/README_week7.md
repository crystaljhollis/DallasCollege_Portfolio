## **Week 7: Chapter 6 – Exploring Spatial Data**

📂 **Package Link** [`Lab 6 Package Link (ArcGIS Pro)`](https://arcg.is/1HmP84)

---

### **Assignment Description**

This week’s lab focuses on **Chapter 6: Exploring Spatial Data**, using ArcPy to examine the structure and content of spatial datasets programmatically. Students practice checking dataset validity, describing geometry and attribute fields, and analyzing metadata using Python.

💡 **Key Concepts Covered:**
- Verifying the existence of datasets using `arcpy.Exists()`
- Exploring dataset properties with `arcpy.Describe()`
- Listing datasets with `arcpy.ListFeatureClasses()` and `arcpy.ListFields()`
- Accessing attributes like `shapeType`, `dataType`, and `spatialReference`
- Organizing outputs using Python lists and dictionaries
- Manipulating field names, field types, and workspace contents

---

### **Deliverables**

- Working `.py` scripts located in the `week7/` directory that:
  - Check for dataset existence
  - Use `Describe()` to inspect datasets
  - List feature classes and field attributes in the workspace
  - Demonstrate list and dictionary manipulation using spatial data
- Demonstrated understanding of:
  - Describing datasets vs. listing datasets
  - Iterating through fields and reporting metadata
  - Extracting coordinate system and shape type info
