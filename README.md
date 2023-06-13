# aqi_pm25_facilities
This repository contains the data and code used to calculate the peak and mean PM2.5 AQI values referenced in Alleen Brown's article for The Appeal on the impact of Canadian wildfire smoke on people incarcerated in prisons, jails, and other carceral facilities in Delaware, New Jersey, New York, and Pennsylvania.

## Data Sources
- Facility Data: The vast majority of the facility data comes from the Department of Homeland Security's [Homeland Infrastructure Foundation-Level Data (HIFLD)](https://hifld-geoplatform.opendata.arcgis.com/datasets/geoplatform::prison-boundaries/about).
- AQI Data: Data on the [Air Quality Index for 2.5mm particulate matter](https://www.airnow.gov/sites/default/files/2020-05/aqi-technical-assistance-document-sept2018.pdf) comes from the [Environmental Protection Agency's AirNow program](https://docs.airnowapi.org/files).

## Methodology
The EPA collects data on particulate matter pollution from hundreds of monitoring sites across the country, most of which are run by state or local agencies. To calculate the peak and mean AQI values, we first determined the monitoring site closest to each facility, excluding facilities with no monitoring sites closer than 25 miles. Then we calculated the peak AQI on June 7, 2023, (when pollution caused by the fires was at its worst) by determining the highest 1-hour average value at each monitoring site. We also calculated an average value for the entire 24-hour period, as this is the figure the EPA uses to report the official AQI each day.

The EPA underlines in its guidelines for data use that AirNow data is preliminary and has not been fully validated. A separate database, called the Air Quality System, contains more finalized air quality information — however it can take more than six months from when the data is collected for it to appear in the system. AirNow remains the agency’s source for real-time air quality information.

## Data Products
We created two data products from our analysis:
- [`pm25_aqi_by_facility`](https://github.com/the-appeal/aqi_pm25_facilities/blob/f34ed29956bcabe8c1a33bf41cb72197d1d689ef/src/aqi_pm_25_facilities/data/processed/pm25_aqi_by_facility.csv): A CSV file containing data about each facility
- [`https://github.com/the-appeal/aqi_pm25_facilities/blob/f34ed29956bcabe8c1a33bf41cb72197d1d689ef/src/aqi_pm_25_facilities/data/processed/pm25_aqi_by_facility.geojson`](https://github.com/the-appeal/aqi_pm25_facilities/blob/f34ed29956bcabe8c1a33bf41cb72197d1d689ef/src/aqi_pm_25_facilities/data/processed/pm25_aqi_by_facility.geojson): The same exact data but in GeoJSON format with polygons added for each facility

These datasets contain the following fields:
| Field | Data Type | Description | Source |
| ----- | --------- | ----------- | ------ |
| `facility_name` | `str | The facility's name | HIFLD |
| `facility_address` | `str` | The facility's address | HIFLD |
| `facility_city` | `str` | The city in which the facility is located | HIFLD |
| `facility_state` | `str` | The state in which the facility is located | HIFLD |
| `facility_zip` | `str` | The ZIP code for the facility | HIFLD |
| `facility_latitude` | `float` | The latitude of the facility's centroid | HIFLD |
| `facility_longitude` | `float` | The longitude of the facility's centroid | HIFLD |
| `facility_type` | `str` | The type of facility (e.g., state, local, county, juvenile) | HIFLD |
| `facility_capacity` | `str` | The maximum number of people a facility is rated to house | HIFLD |
| `facility_status` | `str` | Whether the facility is open or closed (we only include open facilities in the dataset, so this is somewhat superfluous) | HIFLD |
| `facility_data_source` | `str` | The URL for the data use originally used by HIFLD to compile the data | HIFLD |
| `facility_data_source_date` | `datetime` | The date on which the data source was first accessed | HIFLD |
| `facility_data_edit_date` | `datetime`  | The date on which the data was last edited | HIFLD |
| `monitoring_site_name` | `str` | The name of the nearest PM2.5 AQI monitoring site | AirNow |
| `monitoring_site_state` | `str` | The state in which the nearest monitoring site is located | AirNow |
| `monitoring_site_county` | `str | The county in which the nearest monitoring site is located | AirNow |
| `monitoring_site_latitude` | `float` | The nearest monitoring site's latitude | AirNow |
| `monitoring_site_longitude` | `float` | The nearest monitoring site's longitude | AirNow |
| `peak_pm25_aqi` | `int` | The peak PM2.5 AQI measured by the nearest monitoring site on June 7, 2023 | AirNow |
| `mean_pm25_aqi` | `int` | The mean PM2.5 AQI measured by the nearest monitoring site on June 7, 2023 | AirNow |
| `geometry` (GeoJSON file only) | `polygon` | A polygon representing the boundaries of the facility | HIFLD |

## Questions
If you have any questions about this data or our analysis, please reach out to [Alleen Brown](mailto:alleen.brown56@gmail.com) or [Ethan Corey](mailto:ethan.corey@theappeal.org).
