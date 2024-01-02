# -*- coding: utf-8 -*-
"""
The data comes from https://openflights.org/data.html

As of January 2017, the OpenFlights Airports Database contains over 10,000 airports, train stations and ferry terminals spanning the globe, as shown in the map above. Each entry contains the following information:

Airport ID	Unique OpenFlights identifier for this airport.
Name	Name of airport. May or may not contain the City name.
City	Main city served by airport. May be spelled differently from Name.
Country	Country or territory where airport is located. See countries.dat to cross-reference to ISO 3166-1 codes.
IATA	3-letter IATA code. Null if not assigned/unknown.
ICAO	4-letter ICAO code.
Null if not assigned.
Latitude	Decimal degrees, usually to six significant digits. Negative is South, positive is North.
Longitude	Decimal degrees, usually to six significant digits. Negative is West, positive is East.
Altitude	In feet.
Timezone	Hours offset from UTC. Fractional hours are expressed as decimals, eg. India is 5.5.
DST	Daylight savings time. One of E (Europe), A (US/Canada), S (South America), O (Australia), Z (New Zealand), N (None) or U (Unknown). See also: Help: Time
Tz database time zone	Timezone in "tz" (Olson) format, eg. "America/Los_Angeles".
Type	Type of the airport. Value "airport" for air terminals, "station" for train stations, "port" for ferry terminals and "unknown" if not known. In airports.csv, only type=airport is included.
Source	Source of this data. "OurAirports" for data sourced from OurAirports, "Legacy" for old data not matched to OurAirports (mostly DAFIF), "User" for unverified user contributions. In airports.csv, only source=OurAirports is included.
The data is UTF-8 encoded.
"""
print(__doc__)

import pandas as pd
import numpy as np
import seaborn as sns
from sklearn.cluster import DBSCAN

sns.set_style("ticks")

def loadData(filename):
    columnHeaders = ["id", "name", "city", "country", "IATA", "ICAO",\
                     "lat", "lon", "alt", "tz", "DST", "TZ_DB", "type", "source"]
    return pd.read_csv(filename, header=None, index_col=0, names=columnHeaders )

path = "../datasets/"
file = "airports.dat"

df = loadData(path+file)

df_for_clustering = df[["IATA", "lat", "lon"]]
# eps = distance_in_kilometers/kilometers_per_radians
distance_in_km = 160.
km_per_radians=6371.
df_for_clustering["dbscan_labels"] = DBSCAN(eps=distance_in_km/km_per_radians, min_samples=5, algorithm='ball_tree', metric="haversine").fit_predict(df_for_clustering[["lat", "lon"]].apply(np.radians))
print(df_for_clustering)

sns.lmplot('lon', # Horizontal axis
           'lat', # Vertical axis
           data=df_for_clustering, # Data source
           fit_reg=False, # Don't fix a regression line
           hue="dbscan_labels", # Set color
           scatter_kws={"marker": "D", # Set marker style
                        "s": 2},
           height=10, legend=False) # S marker size