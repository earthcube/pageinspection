
**Role:** You are an expert data scientist with extensive knowledge of `schema.org` and JSON-LD for describing scientific datasets and organizations.

**Goal:** Your primary goal is to generate comprehensive and valid `schema.org` JSON-LD markup for the HydroSHEDS website ([https://www.hydrosheds.org](https://www.hydrosheds.org)), its data catalogs, and individual datasets, following current best practices to enhance discoverability and machine readability.

**Context:**
* The target website is: `https://www.hydrosheds.org`
* All schema.org content should be encoded in JSON-LD.
* The `schema.org` types to be used are:
    * `WebSite`
    * `Organization`
    * `DataCatalog`
    * `Dataset`
    * `DataDownload`
    * `SpatialCoverage`  
    * `TemporalCoverage`  

**General Guidelines for JSON-LD Generation:**
* **`@context`**: Always use `"http://schema.org"`.
* **`@id`**: Use a canonical URL for each entity being described.
* **Required Properties**: Ensure all required properties for each `schema.org` type are included.
* **Recommended Properties**: Include as many relevant recommended properties as possible to enrich the data.
* **Keywords**: For descriptions, aim to extract relevant keywords to populate the `keywords` property.
* **Nesting**: Nest related entities (e.g., `Dataset` within `DataCatalog`, `DataDownload` within `Dataset`) where appropriate to establish relationships clearly.

---

**Step 1: Website and Organization Description**

1.  **Directive:** Generate the `schema.org` JSON-LD for the HydroSHEDS website as a `WebSite` type and the HydroSHEDS organization as an `Organization` type.
    * The `WebSite` should include at least a `name` (title) and `url`. The `@id` should be the website's root URL.
    * The `Organization` should represent "HydroSHEDS" and include relevant properties like `name`, `url`, `logo`, `description`, etc., as discoverable from the website. The `@id` should also be the website's root URL or a clear identifier for the organization within the website.
2.  **Output Format:** Provide the JSON-LD in a single code block.
3.  **Refinement:** (After your generation) I will review and provide feedback for refinement.

---

**Step 2: Identify Data Groups (DataCatalogs)**

1.  **Directive:** Navigate the HydroSHEDS website (`https://www.hydrosheds.org`) and identify all distinct "groups" or categories of datasets that can be logically represented as `DataCatalog` entries. For each identified group, provide:
    * A descriptive name for the `DataCatalog`.
    * The URL that represents this `DataCatalog` (if a dedicated page exists). If not, describe how it is grouped on the site.
2.  **Output Format:** A bulleted list of identified `DataCatalog` names and their corresponding URLs.
3.  **Refinement:** (After your list) I will select one specific group for the next steps and may ask for clarification or further details if needed.

---

**Step 3: Detail a Specific DataCatalog (Example)**

*(I will pick one group from your Step 2 list, for example, "HydroBASINS" or "HydroRIVERS".)*

1.  **Directive:** For the selected `DataCatalog` (e.g., "HydroBASINS" at [insert URL if applicable]), extract the following information:
    * `name`: The title of the data catalog.
    * `description`: A concise description of the data catalog.
    * `keywords`: A comma-separated list of relevant keywords derived from the description and content of the `DataCatalog` page.
    * `url`: The canonical URL for this specific `DataCatalog`.
2.  **Output Format:** A clearly labeled list of the extracted properties.
3.  **Refinement:** (After your extraction) I will confirm the details or ask for adjustments.

---

**Step 4: Identify and List Datasets within the Selected DataCatalog**

1.  **Directive:** For the selected `DataCatalog` (e.g., "HydroBASINS"), navigate its content to identify individual datasets. For each dataset found:
    * Provide its `name` (use the file name if no explicit name is given).
    * Provide the direct download `url` for the dataset (this will be the `@id` for the `DataDownload`).
    * Indicate how it relates to the parent `DataCatalog`.
2.  **Output Format:** A bulleted list, with each bullet representing a dataset and its `name` and `url`.
3.  **Refinement:** (After your list) I will confirm the list or ask for refinement.

---

**Step 5: Describe Five Specific Datasets (Example)**

*(I will pick five datasets from your Step 4 list.)*

1.  **Directive:** For the five selected datasets, generate `schema.org` JSON-LD markup for each as a `Dataset` type. For each `Dataset`:
    * Include a `name` (using file name if no explicit name).
    * Set the `@id` to the canonical URL of the dataset's information page if available, or a clear identifier derived from its name and `DataCatalog` URL.
    * Link to its parent `DataCatalog` using the `isAccessibleForFree` or `includedInDataCatalog` property.
    * Include a `description` if discernible from the website.
    * Include a `keywords` property if keywords can be extracted from the description.
    * Provide a `DataDownload` property for each distribution, including:
        * `name` (e.g., file name with extension).
        * `contentUrl` (the direct download URL).
        * `encodingFormat` (e.g., "application/zip", "application/x-shapefile", "image/tiff").
        * Optionally, `contentSize` if available.
    * If spatial or temporal information is provided for the dataset on the site, include `spatialCoverage` and/or `temporalCoverage` properties.
        * `spatialCoverage` should use `Place` or `GeoShape` with properties like `geo` (e.g., `GeoCoordinates` with `latitude`, `longitude`, or `box` for bounding box).
        * `temporalCoverage` should use ISO 8601 date format (e.g., "YYYY-MM-DD", "YYYY-MM-DD/YYYY-MM-DD", or "YYYY/..").
2.  **Output Format:** Five separate JSON-LD code blocks, one for each dataset.
3.  **Refinement:** (After your generation) I will review and confirm validity, asking for adjustments as needed.

---

**Step 6: Generate Full DataCatalog JSON-LD**

1.  **Directive:** Using the information gathered and refined in the previous steps for the selected `DataCatalog`, generate the complete `schema.org` JSON-LD for that `DataCatalog`, ensuring it includes all the `Dataset` entries identified for it.
2.  **Output Format:** A single JSON-LD code block representing the `DataCatalog` with its nested `Dataset` entities.
3.  **Validation:** Validate the generated JSON-LD using Google's Rich Results Test or Schema.org Validator and report any errors or warnings.

---

**Step 7: Generate JSON-LD for All Groups and Validate**

1.  **Directive:** Repeat Steps 3, 4, 5 (as necessary to gather details), and 6 for *all* identified `DataCatalog` groups on the HydroSHEDS website.
2.  **Output Format:** A separate JSON-LD code block for each `DataCatalog`, along with validation results for each.
3.  **Validation:** Validate each generated JSON-LD using Google's Rich Results Test or Schema.org Validator and report any errors or warnings.

---
