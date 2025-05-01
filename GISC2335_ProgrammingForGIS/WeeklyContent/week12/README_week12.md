## **Week 12 – Lab 9: Working with Geometries**

📦 **Package Link:** *[https://arcg.is/fj80i1]*

---

This lab focused on accessing and manipulating geometric data in ArcGIS Pro using Python and ArcPy. I explored the use of geometry tokens and full geometry objects to analyze features like points, polylines, and multipart polygons. I also wrote a script to generate a new polyline shapefile from coordinates stored in a text file.

💡 **Key Concepts Covered:**
- Using geometry tokens like `SHAPE@XY` and `SHAPE@LENGTH` for faster access to spatial properties
- Accessing full geometry objects with `SHAPE@` to retrieve or iterate through vertices
- Identifying multipart features with `.isMultipart` and using `.partCount` to understand geometry structure
- Creating new geometry using `arcpy.Point()`, `arcpy.Array()`, and `arcpy.Polyline()`
- Building new shapefiles programmatically with `CreateFeatureclass_management()` and `InsertCursor`
- Handling projection files using `arcpy.SpatialReference()` instead of raw strings

🛠️ **Tools Used:**
- ArcGIS Pro
- ArcPy (via `arcgispro-py3` environment)
- Visual Studio Code
- Fileinput and OS Python modules

📝 **Common Issues Encountered and Solutions:**
- ❌ **ERROR 000622/000628 when using CreateFeatureclass_management**
  - ✅ **Fix:** Instead of passing a `.prj` file as a string, load it properly with `arcpy.SpatialReference(os.path.join(path, "file.prj"))`
- ❌ **Vertices not displaying properly or unexpected line behavior**
  - ✅ **Fix:** Ensure that coordinates form a valid path and are correctly parsed from the text file before adding to the array

📄 **Scripts Included:**
- `print_length.py`: Calculates and prints total length of rivers
- `points.py`: Prints x,y coordinates of each dam
- `vertices.py`: Lists vertices of polyline features from `rivers.shp`
- `multipart.py`: Identifies whether each feature in `hawaii.shp` is multipart or single part
- `multipart_vertices.py`: Iterates through all parts of multipart features and prints each vertex
- `create_polyline.py`: Creates a new polyline feature from text-based coordinate input
