// Defining a data model.
class DataPage {
  // fileName string
  resolution string
  fileSize string
  link  string  @description("a url pointing to a .zip file")
}

class Links {
  distributions  DataPage[]
}

// Create a function to extract the pagecontent from a string.
function ExtractDataset(pagecontent: string) -> Links {
  // Specify a client as provider/model-name
  // you can use custom LLM params with a custom client name from clients.baml like "client CustomHaiku"
  client "LocalGemma"                  // use the custom client name with ollama
  // client "openai/gpt-4o" // Set OPENAI_API_KEY to use this client.
  // client "google-ai/gemini-1.5-pro" 
  // client "CustomGemini"
  prompt #"

    Look for lines in the following content for:
    * resolution
    * file size 
    * URL

    Only look at lines with the phase ".zip" in them and make sure they get linked as distributions

    Extract download links from this content, there will likely 
    be many.

    {{ pagecontent }}

    {{ ctx.output_format }}
  "#
}

// Test the function with a sample pagecontent. Open the VSCode playground to run this.
test example_datapage {
  functions [ExtractDataset]
  args {
    pagecontent #"
 
[![HydroSHEDS word, with the logo as the O. The logo is a globe with graticule lines and a wave across the centre.](https://cdn.prod.website-files.com/602eb43d42a3b5553a4f134c/62421e0391da2b54f8930663_HydroSHEDS_logo.svg)](https://www.hydrosheds.org/)
[Home](https://www.hydrosheds.org/)
[About](https://www.hydrosheds.org/about)
[Products](https://www.hydrosheds.org/products)
[Applications](https://www.hydrosheds.org/applications)
[FAQ](https://www.hydrosheds.org/faq)
[](https://www.hydrosheds.org/hydrosheds-core-downloads)
###### [HydroSHEDS](https://www.hydrosheds.org/products/hydrosheds)
###### [HydroATLAS](https://www.hydrosheds.org/products/hydroatlas)
###### [HydroBASINS](https://www.hydrosheds.org/products/hydrobasins)
###### [HydroRIVERS](https://www.hydrosheds.org/products/hydrorivers)
###### [HydroLAKES](https://www.hydrosheds.org/products/hydrolakes)
###### [GLWD](https://www.hydrosheds.org/products/glwd)
###### [HydroWASTE](https://www.hydrosheds.org/products/hydrowaste)
###### [GloRiC](https://www.hydrosheds.org/products/gloric)
###### [HydroFALLS](https://www.hydrosheds.org/products/hydrofalls)
###### [LakeTEMP](https://www.hydrosheds.org/products/laketemp)
## HydroSHEDS Core Data Downloads
This page provides downloads for HydroSHEDS core data products. More information about the HydroSHEDS data products can be found on our [products](https://www.hydrosheds.org/products) page. 
This page currently provides downloads for the latest **version 1.1 of HydroSHEDS** , and will be updated when data from the upcoming [HydroSHEDS v2](https://www.hydrosheds.org/hydrosheds-v2) is released.
### Data format and layers
HydroSHEDS core layers are distributed in GeoTIFF format in resolutions from 3 arc-seconds to 6 arc-minutes. For details regarding the HydroSHEDS core products, please consult the [HydroSHEDS Technical Documentation](https://data.hydrosheds.org/file/technical-documentation/HydroSHEDS_TechDoc_v1_4.pdf).
All products at a resolution of 15 arc-seconds or coarser are available either as continental tiles or in full global coverage.
The 3 arc-second layers are available as 10x10 degree tiles or as continental tiles. All 10x10 degree tiles are named with a 7-digit identifier based on the coordinates of their lower-left (southwest) corner.

**Note for users of version 1.0** (now obsolete): legacy users requiring HydroSHEDS data in the former BIL or GRID formats offered in version 1.0 can access our legacy archive [here.](https://www.hydrosheds.org/downloads-archive)

### Downloads
The following tabs provide data downloads for the different HydroSHEDS core layers at resolutions of 3, 15, or 30 arc-seconds (3s, 15s, 30s), or at 5 or 6 arc-minutes (5m, 6m).
Void-filled DEMConditioned DEMFlow DirectionFlow AccumulationFlow LengthLand Mask
This tab provides the void-filled digital elevation model underpinning HydroSHEDS v1. The following table provides links to download continental and global tiles at 3s, 15s, and 30s resolutions. Below the table, data in 3s resolution can also be downloaded in individual 10x10 degree tiles.
Void-filled DEM Continental and global downloads Extent | Resolution | File size | Link  
---|---|---|---  
Africa| 3s| 3525MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/af_dem_3s.zip)  
Asia| 3s| 4800MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/as_dem_3s.zip)  
Australasia| 3s| 1587MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/au_dem_3s.zip)  
Europe and Middle East| 3s| 2448MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/eu_dem_3s.zip)  
North and Central America| 3s| 2847MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/na_dem_3s.zip)  
South America| 3s| 2478MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/sa_dem_3s.zip)  
Africa| 15s| 171MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/hyd_af_dem_15s.zip)  
Arctic (northern Canada)| 15s| 76MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/hyd_ar_dem_15s.zip)  
Asia| 15s| 171MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/hyd_as_dem_15s.zip)  
Australasia| 15s| 74MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/hyd_au_dem_15s.zip)  
Europe and Middle East| 15s| 153MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/hyd_eu_dem_15s.zip)  
Greenland| 15s| 31MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/hyd_gr_dem_15s.zip)  
North and Central America| 15s| 133MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/hyd_na_dem_15s.zip)  
South America| 15s| 116MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/hyd_sa_dem_15s.zip)  
Siberia| 15s| 143MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/hyd_si_dem_15s.zip)  
Global| 15s| 1048MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/hyd_glo_dem_15s.zip)  
Arctic (northern Canada)| 30s| 25MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/hyd_ar_dem_30s.zip)  
Africa| 30s| 48MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/hyd_af_dem_30s.zip)  
Asia| 30s| 47MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/hyd_as_dem_30s.zip)  
Australasia| 30s| 21MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/hyd_au_dem_30s.zip)  
Europe and Middle East| 30s| 44MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/hyd_eu_dem_30s.zip)  
Greenland| 30s| 11MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/hyd_gr_dem_30s.zip)  
North and Central America| 30s| 37MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/hyd_na_dem_30s.zip)  
South America| 30s| 32MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/hyd_sa_dem_30s.zip)  
Siberia| 30s| 45MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/hyd_si_dem_30s.zip)  
Global| 30s| 306MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dem/hyd_glo_dem_30s.zip)  
The following tree contains 10x10 degree tiles for download, grouped by continent. Find the tile within its respective continent's folder, and then click on each tile name to download that tile.
  * [Loading ...](https://www.hydrosheds.org/hydrosheds-core-downloads)


×
Preparing files for download. Please stay on this page.
[× Close section](https://www.hydrosheds.org/hydrosheds-core-downloads)
This tab provides the hydrologically conditioned digital elevation model underpinning HydroSHEDS v1, available only at 3s resolution.
The following table provides links to download continental tiles at 3s resolution. Below the table, data in 3s resolution can also be downloaded in individual 10x10 degree tiles.
Hydrologically conditioned DEM Continental and global downloads Extent | Resolution | File size | Link  
---|---|---|---  
Africa| 3s| 3156MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-con/af_con_3s.zip)  
Asia| 3s| 4555MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-con/as_con_3s.zip)  
Australasia| 3s| 1458MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-con/au_con_3s.zip)  
Europe and Middle East| 3s| 2286MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-con/eu_con_3s.zip)  
North and Central America| 3s| 2705MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-con/na_con_3s.zip)  
South America| 3s| 2300MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-con/sa_con_3s.zip)  
The following tree contains 10x10 degree tiles for download, grouped by continent. Find the tile within its respective continent's folder, and then click on each tile name to download that tile.
  * [Loading ...](https://www.hydrosheds.org/hydrosheds-core-downloads)


×
Preparing files for download. Please stay on this page.
[× Close section](https://www.hydrosheds.org/hydrosheds-core-downloads)
This tab provides the HydroSHEDS flow direction grids. The following table provides links to download continental and global tiles at 3s, 15s, 30s, 5m, and 6m resolutions. Below the table, data in 3s resolution can also be downloaded in individual 10x10 degree tiles.
Note that as an exception, the flow direction grids at the 5m and 6m resolutions have been updated from the [legacy v1.0](https://www.hydrosheds.org/downloads-archive) data. Data at all other resolutions match the legacy v1.0 flow directions.
Flow Directions Continental and global downloads Extent | Resolution | File size | Link  
---|---|---|---  
Africa| 3s| 1321MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/af_dir_3s.zip)  
Asia| 3s| 1335MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/as_dir_3s.zip)  
Australasia| 3s| 617MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/au_dir_3s.zip)  
Europe and Middle East| 3s| 821MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/eu_dir_3s.zip)  
North and Central America| 3s| 918MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/na_dir_3s.zip)  
South America| 3s| 816MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/sa_dir_3s.zip)  
Africa| 15s| 56MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/hyd_af_dir_15s.zip)  
Arctic (northern Canada)| 15s| 23MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/hyd_ar_dir_15s.zip)  
Asia| 15s| 46MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/hyd_as_dir_15s.zip)  
Australasia| 15s| 26MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/hyd_au_dir_15s.zip)  
Europe and Middle East| 15s| 47MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/hyd_eu_dir_15s.zip)  
Greenland| 15s| 7MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/hyd_gr_dir_15s.zip)  
North and Central America| 15s| 39MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/hyd_na_dir_15s.zip)  
South America| 15s| 35MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/hyd_sa_dir_15s.zip)  
Siberia| 15s| 41MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/hyd_si_dir_15s.zip)  
Global| 15s| 308MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/hyd_glo_dir_15s.zip)  
Africa| 30s| 15MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/hyd_af_dir_30s.zip)  
Arctic (northern Canada)| 30s| 7MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/hyd_ar_dir_30s.zip)  
Asia| 30s| 12MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/hyd_as_dir_30s.zip)  
Australasia| 30s| 7MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/hyd_au_dir_30s.zip)  
Europe and Middle East| 30s| 13MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/hyd_eu_dir_30s.zip)  
Greenland| 30s| 2MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/hyd_gr_dir_30s.zip)  
North and Central America| 30s| 10MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/hyd_na_dir_30s.zip)  
South America| 30s| 9MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/hyd_sa_dir_30s.zip)  
Siberia| 30s| 11MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/hyd_si_dir_30s.zip)  
Global| 30s| 83MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/hyd_glo_dir_30s.zip)  
Global| 5m| 1MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/hyd_glo_dir_5m.zip)  
Global| 6m| 1MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-dir/hyd_glo_dir_6m.zip)  
The following tree contains 10x10 degree tiles for download, grouped by continent. Find the tile within its respective continent's folder, and then click on each tile name to download that tile.
  * [Loading ...](https://www.hydrosheds.org/hydrosheds-core-downloads)


×
Preparing files for download. Please stay on this page.
[× Close section](https://www.hydrosheds.org/hydrosheds-core-downloads)
This tab provides the HydroSHEDS flow accumulation grids. The following tables provide links to download continental and global tiles at 3s, 15s, and 30s resolutions. Flow accumulations are available as number of accumulated grid cells (ACC) or as accumulated upstream area in hectares (ACA; only available at 15s resolution). Below the tables, data in 3s resolution can also be downloaded in individual 10x10 degree tiles.
Flow accumulation (ACC) grids Continental and global downloads Extent | Resolution | File size | Link  
---|---|---|---  
Africa| 3s| 3383MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/af_acc_3s.zip)  
Asia| 3s| 2944MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/as_acc_3s.zip)  
Australasia| 3s| 1511MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/au_acc_3s.zip)  
Europe and Middle East| 3s| 2012MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/eu_acc_3s.zip)  
North and Central America| 3s| 2413MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/na_acc_3s.zip)  
South America| 3s| 2103MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/sa_acc_3s.zip)  
Africa| 15s| 130MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/hyd_af_acc_15s.zip)  
Arctic (northern Canada)| 15s| 78MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/hyd_ar_acc_15s.zip)  
Asia| 15s| 109MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/hyd_as_acc_15s.zip)  
Australasia| 15s| 58MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/hyd_au_acc_15s.zip)  
Europe and Middle East| 15s| 119MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/hyd_eu_acc_15s.zip)  
Greenland| 15s| 49MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/hyd_gr_acc_15s.zip)  
North and Central America| 15s| 92MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/hyd_na_acc_15s.zip)  
South America| 15s| 79MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/hyd_sa_acc_15s.zip)  
Siberia| 15s| 124MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/hyd_si_acc_15s.zip)  
Global| 15s| 818MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/hyd_glo_acc_15s.zip)  
Africa| 30s| 32MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/hyd_af_acc_30s.zip)  
Arctic (northern Canada)| 30s| 19MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/hyd_ar_acc_30s.zip)  
Asia| 30s| 27MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/hyd_as_acc_30s.zip)  
Australasia| 30s| 15MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/hyd_au_acc_30s.zip)  
Europe and Middle East| 30s| 29MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/hyd_eu_acc_30s.zip)  
Greenland| 30s| 13MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/hyd_gr_acc_30s.zip)  
North and Central America| 30s| 23MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/hyd_na_acc_30s.zip)  
South America| 30s| 20MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/hyd_sa_acc_30s.zip)  
Siberia| 30s| 30MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/hyd_si_acc_30s.zip)  
Global| 30s| 206MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-acc/hyd_glo_acc_30s.zip)  
Accumulated area (ACA) grids Continental and global downloads Extent | Resolution | File size | Link  
---|---|---|---  
Africa| 15s| 143MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-aca/hyd_af_aca_15s.zip)  
Arctic (northern Canada)| 15s| 86MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-aca/hyd_ar_aca_15s.zip)  
Asia| 15s| 121MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-aca/hyd_as_aca_15s.zip)  
Australasia| 15s| 63MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-aca/hyd_au_aca_15s.zip)  
Europe and Middle East| 15s| 132MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-aca/hyd_eu_aca_15s.zip)  
Global| 15s| 904MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-aca/hyd_glo_aca_15s.zip)  
Greenland| 15s| 55MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-aca/hyd_gr_aca_15s.zip)  
North and Central America| 15s| 102MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-aca/hyd_na_aca_15s.zip)  
South America| 15s| 87MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-aca/hyd_sa_aca_15s.zip)  
Siberia| 15s| 136MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-aca/hyd_si_aca_15s.zip)  
The following tree contains 10x10 degree tiles for download, grouped by continent. Find the tile within its respective continent's folder, and then click on each tile name to download that tile. Note that only the number of accumulated grid cells (ACC) data are available at this resolution.
  * [Loading ...](https://www.hydrosheds.org/hydrosheds-core-downloads)


×
Preparing files for download. Please stay on this page.
[× Close section](https://www.hydrosheds.org/hydrosheds-core-downloads)
This tab provides the HydroSHEDS flow length grids at 15s resolution. Flow lengths are available as the distance (in meters) from the furthest river source in upstream direction (LUP) or as the distance (in meters) from the final pour point of the river in downstream direction, i.e., at the ocean or an inland sink (LDN).
Flow length upstream Continental and global downloads Extent | Resolution | File size | Link  
---|---|---|---  
Africa| 15s| 170MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-lup/hyd_af_lup_15s.zip)  
Arctic (northern Canada)| 15s| 114MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-lup/hyd_ar_lup_15s.zip)  
Asia| 15s| 151MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-lup/hyd_as_lup_15s.zip)  
Australasia| 15s| 76MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-lup/hyd_au_lup_15s.zip)  
Europe and Middle East| 15s| 167MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-lup/hyd_eu_lup_15s.zip)  
Greenland| 15s| 66MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-lup/hyd_gr_lup_15s.zip)  
North and Central America| 15s| 129MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-lup/hyd_na_lup_15s.zip)  
South America| 15s| 101MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-lup/hyd_sa_lup_15s.zip)  
Siberia| 15s| 175MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-lup/hyd_si_lup_15s.zip)  
Global| 15s| 1128MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-lup/hyd_glo_lup_15s.zip)  
Flow length downstream Continental and global downloads Extent | Resolution | File size | Link  
---|---|---|---  
Africa| 15s| 402MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-ldn/hyd_af_ldn_15s.zip)  
Arctic (northern Canada)| 15s| 201MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-ldn/hyd_ar_ldn_15s.zip)  
Asia| 15s| 340MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-ldn/hyd_as_ldn_15s.zip)  
Australasia| 15s| 160MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-ldn/hyd_au_ldn_15s.zip)  
Europe and Middle East| 15s| 355MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-ldn/hyd_eu_ldn_15s.zip)  
Greenland| 15s| 95MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-ldn/hyd_gr_ldn_15s.zip)  
North and Central America| 15s| 287MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-ldn/hyd_na_ldn_15s.zip)  
South America| 15s| 241MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-ldn/hyd_sa_ldn_15s.zip)  
Siberia| 15s| 360MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-ldn/hyd_si_ldn_15s.zip)  
Global| 15s| 2421MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-ldn/hyd_glo_ldn_15s.zip)  
[× Close section](https://www.hydrosheds.org/hydrosheds-core-downloads)
This tab provides the HydroSHEDS land mask grids. The following table provides links to download continental and global tiles at at 3s, 15s, 30s, 5m, and 6m resolutions. Below the table, data in 3s resolution can also be downloaded in individual 10x10 degree tiles.
Land mask Continental and global downloads Extent | Resolution | File size | Link  
---|---|---|---  
Africa| 3s| 133MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/af_msk_3s.zip)  
Asia| 3s| 164MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/as_msk_3s.zip)  
Australasia| 3s| 172MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/au_msk_3s.zip)  
Europe and Middle East| 3s| 97MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/eu_msk_3s.zip)  
North and Central America| 3s| 128MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/na_msk_3s.zip)  
South America| 3s| 118MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/sa_msk_3s.zip)  
Africa| 15s| 5MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/hyd_af_msk_15s.zip)  
Arctic (northern Canada)| 15s| 5MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/hyd_ar_msk_15s.zip)  
Asia| 15s| 6MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/hyd_as_msk_15s.zip)  
Australasia| 15s| 7MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/hyd_au_msk_15s.zip)  
Europe and Middle East| 15s| 7MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/hyd_eu_msk_15s.zip)  
Greenland| 15s| 2MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/hyd_gr_msk_15s.zip)  
North and Central America| 15s| 5MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/hyd_na_msk_15s.zip)  
South America| 15s| 5MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/hyd_sa_msk_15s.zip)  
Siberia| 15s| 5MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/hyd_si_msk_15s.zip)  
Global| 15s| 45MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/hyd_glo_msk_15s.zip)  
Africa| 30s| 2MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/hyd_af_msk_30s.zip)  
Arctic (northern Canada)| 30s| 2MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/hyd_ar_msk_30s.zip)  
Asia| 30s| 2MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/hyd_as_msk_30s.zip)  
Australasia| 30s| 2MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/hyd_au_msk_30s.zip)  
Europe and Middle East| 30s| 2MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/hyd_eu_msk_30s.zip)  
Greenland| 30s| 1MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/hyd_gr_msk_30s.zip)  
North and Central America| 30s| 2MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/hyd_na_msk_30s.zip)  
South America| 30s| 2MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/hyd_sa_msk_30s.zip)  
Siberia| 30s| 2MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/hyd_si_msk_30s.zip)  
Global| 30s| 14MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/hyd_glo_msk_30s.zip)  
Global| 5m| 1MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/hyd_glo_msk_5m.zip)  
Global| 6m| 1MB| [Download](https://data.hydrosheds.org/file/hydrosheds-v1-msk/hyd_glo_msk_6m.zip)  
The following tree contains 10x10 degree tiles for download, grouped by continent. Find the tile within its respective continent's folder, and then click on each tile name to download that tile.
  * [Loading ...](https://www.hydrosheds.org/hydrosheds-core-downloads)


[× Close section](https://www.hydrosheds.org/hydrosheds-core-downloads)
Hello! This window is too narrow to display the downloads. Please resize the window. If you are on mobile, please visit our site on a computer.
[![HydroSHEDS word, with the logo as the O. The logo is a globe with graticule lines and a wave across the centre.](https://cdn.prod.website-files.com/602eb43d42a3b5553a4f134c/62421e8b14b8c66bd1daa8a3_HydroSHEDS_logo_light.svg)](https://www.hydrosheds.org/)
  * [About](https://www.hydrosheds.org/about)
  * |
  * [News](https://www.hydrosheds.org/news)
  * |
  * [Sponsors](https://www.hydrosheds.org/sponsors)
  * |


  * [Contact](https://www.hydrosheds.org/contact)
  * |
  * [Terms of Use](https://www.hydrosheds.org/terms-of-use)
  * |
  * [Privacy Policy](https://www.hydrosheds.org/privacy)


© HydroSHEDS 2025
By clicking **“Accept All Cookies”** , you agree to the storing of cookies on your device to enhance site navigation, analyze site usage, and assist in our marketing efforts. View our [Privacy Policy](https://www.hydrosheds.org/privacy) for more information.
[Preferences](https://www.hydrosheds.org/hydrosheds-core-downloads)[Deny](https://www.hydrosheds.org/hydrosheds-core-downloads)[Accept](https://www.hydrosheds.org/hydrosheds-core-downloads)
Privacy Preference Center
When you visit websites, they may store or retrieve data in your browser. This storage is often necessary for the basic functionality of the website. The storage may be used for marketing, analytics, and personalization of the site, such as storing your preferences. Privacy is important to us, so you have the option of disabling certain types of storage that may not be necessary for the basic functioning of the website. Blocking categories may impact your experience on the website.
[Reject all cookies](https://www.hydrosheds.org/hydrosheds-core-downloads)[Allow all cookies](https://www.hydrosheds.org/hydrosheds-core-downloads)
Manage Consent Preferences by Category
Essential
**Always Active**
These items are required to enable basic website functionality.
Analytics
Essential
These items help the website operator understand how its website performs, how visitors interact with the site, and whether there may be technical issues. This storage type doesn’t collect information that identifies a visitor.
[Confirm my preferences and close](https://www.hydrosheds.org/hydrosheds-core-downloads)
    "#
  }
}
