# aqi_pm25_facilities
This repository contains the data and code used to calculate the peak and mean PM2.5 AQI values referenced in Alleen Brown's article for The Appeal on the impact of Canadian wildfire smoke on people incarcerated in prisons, jails, and other carceral facilities in Delaware, New Jersey, New York, and Pennsylvania.

## Data Sources
- Facility Data: The vast majority of the facility data comes from the Department of Homeland Security's [Homeland Infrastructure Foundation-Level Data (HIFLD)](https://hifld-geoplatform.opendata.arcgis.com/datasets/geoplatform::prison-boundaries/about). ICE facility data was collected by the Carceral Ecologies team at UCLA.
- AQI Data: Data on the [Air Quality Index for 2.5mm particulate matter](https://www.airnow.gov/sites/default/files/2020-05/aqi-technical-assistance-document-sept2018.pdf) comes from the [Environmental Protection Agency's AirNow program](https://docs.airnowapi.org/files).

## Methodology
The EPA collects data on particulate matter pollution from hundreds of monitoring sites across the country, most of which are run by state or local agencies. To calculate the peak and mean AQI values, we first determined the monitoring site closest to each facility. Then we calculated the peak AQI on June 7, 2023, (when pollution caused by the fires was at its worst) by determining the highest 1-hour average value at each monitoring site. We also calculated an average value for the entire 24-hour period, as this is the figure the EPA uses to report the official AQI each day.

## Questions
If you have any questions about this data or our analysis, please reach out to [Alleen Brown](mailto:alleen.brown56@gmail.com] or [Ethan Corey](mailto:ethan.corey@theappeal.org).
