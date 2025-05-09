## **Week 15 – Logic Flow & Geoprocessing Model**

📦 **Package Link:** *(https://arcg.is/1i5r8D0)*

---

This week focused on applying cumulative Python and GIS knowledge through a **self-assessment project** using **ModelBuilder**. The assignment required completing the ArcGIS Pro tutorial [Make a Geoprocessing Model](https://pro.arcgis.com/en/pro-app/latest/get-started/make-a-geoprocessing-model.htm), which emphasizes logic-driven geoprocessing and automation through visual workflows.

The model, titled **Summarize Invasive Species**, enables users to buffer human contact locations, then summarize the presence of invasive grasses within the buffer zones. It demonstrates real-world GIS applications such as environmental monitoring, public health mapping, and proximity-based analysis.

💡 **Key Concepts Covered:**

* Designing workflow logic using **ModelBuilder**
* Setting up input/output data variables and parameters
* Using **Pairwise Buffer** and **Summarize Within** tools in tandem
* Automating spatial analysis through a reusable geoprocessing tool
* Managing geodatabases and directing output to organized folders
* Customizing tool metadata and symbology for professional presentation

🛠️ **Tools and Techniques Used:**

* ArcGIS Pro 3.x
* ModelBuilder interface
* ArcGIS Online project packaging
* Symbology assignment using `.lyrx` files
* Geodatabase management (default vs. output)

📝 **Common Issues Encountered and Solutions:**

* ❌ **Model parameters not showing in geoprocessing tool**

  * ✅ **Fix:** Set variables as parameters via right-click → “Parameter” in the model view

* ❌ **Output data overwriting or cluttering default geodatabase**

  * ✅ **Fix:** Created `Model_output.gdb` and set it as the default before running the model

* ❌ **Model can't be rerun after changes**

  * ✅ **Fix:** Used the **Validate** button in ModelBuilder to reset tool states

* ❌ **Symbol defaults not applying**

  * ✅ **Fix:** Assigned symbology via `.lyrx` file in Tool Properties → Parameters tab

📄 **Model Workflow Overview:**

1. Input: Human Contact Locations (points, lines, or polygons)
2. Buffer: Creates buffer zones using a specified distance
3. Input: Invasive Species range data (usually polygons)
4. Summarize: Overlays buffers and invasive species to calculate impacted area
5. Output: Feature class summarizing proximity impact in selected area units

📁 **Deliverables Created:**

* `.tbx` toolbox with **Summarize Invasive Species** model
* `.gdb` geodatabase for clean output management
* Customized symbology and tool documentation
* Metadata including summary, tags, and usage help


