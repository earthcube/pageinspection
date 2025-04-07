
// Defining a data model.
class Page {
  // fileName string
  name string
  description string
  keywords  string[]
  publisher Publisher[]?
  potentialAction PotentialAction[]?
}

class Publisher {
  name string
  url string 
}

class PotentialAction {
  target string
  query_input string
}

// Create a function to extract the resume from a string.
function ExtractPage(page: string) -> Page {
  // Specify a client as provider/model-name
  // you can use custom LLM params with a custom client name from clients.baml like "client CustomHaiku"
  client "openai/gpt-4o" // Set OPENAI_API_KEY to use this client.
  // client "google-ai/gemini-1.5-pro" 
  prompt #"

Extract from the page the elements to populate the schema.
Note that Publisher and PotentialAction are not required, so 
only populate those if information can be found.

The PotentialAction is to look for things that might be search or 
query URLs and have a URL pattern, the query input, that can be 
described.  

    {{ page }}

    {{ ctx.output_format }}
  "#
}

// Test the function with a sample resume. Open the VSCode playground to run this.
test demo_page {
  functions [ExtractPage]
  args {
    page #"
 [Skip to main content](https://www.waterqualitydata.us#main-content)
![U.S. flag](https://www.waterqualitydata.us/static/img/us_flag_small.be327dc2.png)
An official website of the United States government
Here’s how you know
Here’s how you know
![](https://www.waterqualitydata.us/static/img/icon-dot-gov.42b4ac46.svg)
**Official websites use .gov** A **.gov** website belongs to an official government organization in the United States. 
![](https://www.waterqualitydata.us/static/img/icon-https.73abd866.svg)
**Secure .gov websites use HTTPS** A **lock** ( LockA locked padlock or **https://** means you’ve safely connected to the .gov website. Share sensitive information only on official, secure websites. 
![National Water Quality Monitoring Council](https://www.waterqualitydata.us/static/img/NWQMC.88f834eb.png) _NATIONAL WATER QUALITY MONITORING COUNCIL_
Menu
![close](https://www.waterqualitydata.us/static/img/close.fe3f13f6.svg)
  * [ Home ](https://www.waterqualitydata.us/)
  * Explore WQP Sites
    * [ NWIS ](https://www.waterqualitydata.us/provider/NWIS/)
    * [WQX ](https://www.waterqualitydata.us/provider/STORET/)
  * Help & About 
    * [ What is the WQP? ](https://www.waterqualitydata.us/wqp_description/)
    * [ Contributing Organizations ](https://www.waterqualitydata.us/orgs/)
    * [ User Guide ](https://www.waterqualitydata.us/portal_userguide/)
    * [ Web Services Guide ](https://www.waterqualitydata.us/webservices_documentation/)
    * [ FAQs ](https://www.waterqualitydata.us/faqs/)
    * [ Upload Data](https://www.waterqualitydata.us/upload_data/)
    * [ Applications using the WQP ](https://www.waterqualitydata.us/apps_using_portal/)
    * [ Other Water Quality Portals ](https://www.waterqualitydata.us/other_portal_links/)
    * [ Publications ](https://www.waterqualitydata.us/publications/)
    * [ Contact Us](https://www.waterqualitydata.us/contact_us/)


### Welcome to the new Water Quality Portal
The Water Quality Portal (WQP) is the premiere source of discrete water-quality data in the United States and beyond. This cooperative service integrates publicly available water-quality data from the United States Geological Survey (USGS), the Environmental Protection Agency (EPA), and over 400 state, federal, tribal, and local agencies. [Learn More](https://www.waterqualitydata.us/portal_userguide/)
To download data complete the query below. Returning and experienced users may wish to use the Advanced Download. 
Close intro 
Don't show again on this computer
Basic
### Download Water Quality Data
  1. completed not completed
  2. completed not completed


## Step 1 of 3 Location Parameters
Specify location parameters to describe the spatial extent of the desired dataset. Additional options are available in the Advanced Download. All fields are optional. 
Country 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
**_Countries_** represented in the database. Multiple selections allowed.
All Countries 
  * No results found
  * Type to search


State 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
**_States_** from the selected country/ies. Multiple selections allowed.
All States 
  * No results found
  * Type to search


County 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
**_Counties_** from the selected state/s. Multiple selections allowed.
All Counties 
  * No results found
  * Type to search


Point Location 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
Enter _latitude_ and _longitude_ (positive/negative **decimal degrees**), and _radial distance_ (**miles**) to create a **_search area_**. Some stations outside the continental US cannot be found using these parameters. _Example:_ Within: **20** miles of Latitude: **46.12** Longitude: **-89.15**
Within
Miles of
Lat
Long
Site Type 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
**_Site type_** indicates _waterbody_ types or other locations where water is found _(atmosphere, natural/human-made features, water uses affecting hydrological conditions)._ Type at least two characters for a list to appear. Multiple selections allowed.
All Site Types 
  * No results found
  * Type to search


Clear search Next
Specify data source, date range, and sampling filters to apply to the desired dataset. Additional options are available in the Advanced Download. All fields are optional. 
Data Source 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
Select one or multiple **_databases_** from which the data will be retrieved. **All** databases are searched by default.
NWIS (USGS)
WQX (EPA)
Date Range 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
Provide an event **_start date_** and/or event **_end date_** to filter by.
Dates should be entered as mm-dd-yyyy
from: 
to: 
Sample Media 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
Identifies the **_environmental medium_** where a sample was taken. Multiple selections allowed.
All Sample Media 
  * No results found
  * Type to search


Characteristic Group 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
Groups of **_environmental measurements_**. Multiple selections allowed. See User Guide for information on which characteristics are included in each group.
All Characteristic Groups 
  * No results found
  * Type to search


Clear search Previous Next
Specify a data type and file format to download. Additional options are available in the Advanced Download. 
Data Profiles 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
**_Water monitoring data_** is delivered in a format and nomenclature defined by the WQX Outbound Schema. _Metadata_ on these formats is displayed in Tables 4-12 of the User Guide.
Organization Data
Site Data Only
Project Data
Sample Results (physical/chemical metadata)
Sample Results (biological metadata)
Sample Results (narrow)
Sampling Activity
File Format 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
Choose a **_file format_** to download the result set.
Comma-Separated
Tab-Separated
MS Excel 2007+
Sort Data 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
**_Sorts data_** by _organization_ , _monitoringLocationID_ , and _activityID_. Sorting **increases** response time. Do not check if you are manually sorting.
Start over  Previous [Download](https://www.waterqualitydata.us#download-status-modal-basic)
Advanced
####  Select Location Parameters 
Specify location parameters to describe the spatial extent of the desired dataset. All fields are optional. 
Country 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
**_Countries_** represented in the database. Multiple selections allowed.
All Countries 
  * No results found
  * Type to search


State 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
**_States_** from the selected country/ies. Multiple selections allowed.
All States 
  * No results found
  * Type to search


County 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
**_Counties_** from the selected state/s. Multiple selections allowed.
All Counties 
  * No results found
  * Type to search


Point Location 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
Enter _latitude_ and _longitude_ (positive/negative **decimal degrees**), and _radial distance_ (**miles**) to create a **_search area_**. Some stations outside the continental US cannot be found using these parameters. _Example:_ Within: **20** miles of Latitude: **46.12** Longitude: **-89.15**
Within
miles of
Latitude Longitude
Bounding Box 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
Enter the North and South _latitudes_ and the East and West _longitudes_ (positive/negative **decimal degrees**) to create a **_bounding box_**. _Example:_ North: **46.12** , East: **-89.15** , South: **45.93** , West: **-89.68**
North: South: East: West:
Site Type 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
**_Site type_** indicates _waterbody_ types or other locations where water is found _(atmosphere, natural/human-made features, water uses affecting hydrological conditions)._ Type at least two characters for a list to appear. Multiple selections allowed.
All Site Types 
  * No results found
  * Type to search


Organization ID 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
Identifies a unique **_business_** or **_company_**. Type at least two characters for a list to appear. Multiple selections allowed.
All Organization IDs 
  * No results found
  * Type to search


Site ID 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
Identifies a **_monitoring location_** by a unique name, number, or code. Type at least two characters for a list to appear. Multiple selections allowed. _Examples:_ For NWIS site: **USGS-301650089215300** For WQX site: **R10BUNKER-CUA005-5**
All Site IDs 
  * No results found
  * Type to search


HUC 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
Identifies the **_hydrological unit_** up to the cataloging unit level of precision. Multiple selections allowed. Separate multiple HUC IDs with a **semicolon** (";"). Select partial HUCs using **trailing wildcards** ("*"). _Examples:_ One site: **01010005** Multiple sites: **01010003;01010004** Partial HUCs: **010801***
Show upstream downstream mapper  Beta
Upstream/Downstream information can be used to help you determine where to collect water quality data based on the flow of water. Select a feature source, and optionally search for a location. Then, click a feature to select upstream/downstream navigation and enter a desired distance. These search criteria will be populated in your query. 
####  Filter Results 
Specify data source, date range, and sampling filters to apply to the desired dataset. All fields are optional. 
Sample Media 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
Identifies the **_environmental medium_** where a sample was taken. Multiple selections allowed.
All Sample Media 
  * No results found
  * Type to search


Characteristic Group 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
Groups of **_environmental measurements_**. Multiple selections allowed. See User Guide for information on which characteristics are included in each group.
All Characteristic Groups 
  * No results found
  * Type to search


Characteristics 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
Identifies types of **_environmental measurements_**. Also known as parameter or analyte; nomenclature may differ across sources. Multiple selections allowed.
All Characteristics 
  * No results found
  * Type to search


Project ID 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
Uniquely identifies a **_data collection project_**. Multiple selections allowed.
All Project IDs 
  * No results found
  * Type to search


Parameter Code(NWIS ONLY) 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
Identifies a characteristic using **_NWIS codes_**. Specifying a parameter code will limit the query to **_NWIS only_**. Multiple selections allowed.
Biological Parameters Assemblage 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
An association of **_interacting populations_** of organisms in a given water body.
All Assemblages 
  * No results found
  * Type to search


Taxonomic Name 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
**_Genus name, species name_** in binomial nomenclature.
All Taxonomic Names 
  * No results found
  * Type to search


Date Range
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
Provide an event **_start date_** and/or event **_end date_** to filter by.
Dates should be entered as mm-dd-yyyy  from: to:
Minimum Sampling Activities Per Site
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
Returns only sites where at least a minimum number of **_sampling activities_** have been reported. The default is **1**.
Minimum Results Per Site
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
Returns only sites where at least a minimum number of **_results_** have been reported. The default is **1**.
####  Download the Data 
Data Source
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
Select one or multiple **_databases_** from which the data will be retrieved. **All** databases are searched by default.
NWIS (USGS)
WQX (EPA)
File Format
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
Choose a **_file format_** to download the result set.
Comma-Separated
Tab-Separated
MS Excel 2007+
Sort Data 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
**_Sorts data_** by _organization_ , _monitoringLocationID_ , and _activityID_. Sorting **increases** response time. Do not check if you are manually sorting.
Data Profiles 
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
**_Water monitoring data_** is delivered in a format and nomenclature defined by the WQX Outbound Schema. _Metadata_ on these formats is displayed in Tables 4-12 of the User Guide.
Organization Data 
Site Data Only
Project Data 
Project Monitoring Location Weighting Data 
Sample Results (physical/chemical metadata) 
Sample Results (biological metadata) 
Sample Results (narrow) 
Sampling Activity 
Sampling Activity Metrics 
Result Detection Quantitation Limit Data 
Biological Habitat Metrics 
Query URL
Copy and share the URL of this query.
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
**_Web service_** for downloading site data and associated metadata. Please see web services guide for additional information.
**cURL**
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
**_Web service_** for direct download of the selected data profile. Please see web services guide for additional information.
**WFS GetFeature**
![info](https://www.waterqualitydata.us/static/img/info.98b24b78.svg)
**_OGC-compliant geospatial web services_** for site data and associated metadata. Please see web services guide for additional information.
Clear search  [ Download ](https://www.waterqualitydata.us#download-status-modal)
  * [What is the WQP?](https://www.waterqualitydata.us/wqp_description/)
  * [Contributing orgs](https://www.waterqualitydata.us/orgs/)
  * [Apps using the WQP](https://www.waterqualitydata.us/apps_using_portal/)
  * [Other Water Quality Portals](https://www.waterqualitydata.us/other_portal_links/)
  * [Explore WQP sites](https://www.waterqualitydata.us/provider/)


[![USGS Science for a changing world](https://www.waterqualitydata.us/static/img/USGS_logo.gif)](http://usgs.gov)
[![EPA](https://www.waterqualitydata.us/static/img/EPA_logo.gif)](http://epa.gov)
**NWIS (USGS)** Last Content Change: 
**WQX (EPA)** Last Content Change: 
### Agency Contact Center
[1-800-424-9067](tel:1-800-424-9067)
WQX@epa.gov
## Download Status 
![close](https://www.waterqualitydata.us/static/img/usa-icons/close.b840e171.svg)
##  Download Status 
![close](https://www.waterqualitydata.us/static/img/usa-icons/close.b840e171.svg)
 "#
  }
}

