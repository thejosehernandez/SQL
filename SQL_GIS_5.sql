# SQL for GIS

#NEED TO LOAD SHAPEFILES TO POSTGRESQL FIRST
#USE POSTGIS 2.0 SHAPEFILE AND DBF LOADER



#COPY FROM TEXT FILE


#MAKE NEW GEOM COLUMN 
SELECT AddGeometryColumn('jose','postal','geom',4269,'POINT',2); 

#UPDATE WITH LAT AND LONG PROVIDED
UPDATE jose.postal SET geom = ST_GeomFromText('POINT(' || long || ' ' || lat || ')',4269);

#COPY FROM CLASS ROSTER CSV
COPY jose.roster (name,zipcode) FROM 'C:\Users\Public\Documents\class_roster.csv' WITH(FORMAT csv, HEADER True, QUOTE "'");

#ASSOCIATE GEOMETRIES FROM POSTAL CODES TABLE AND ROSTER TABLE
SELECT roster.name, roster.zipcode, postal.geom FROM jose.postal INNER JOIN jose.roster ON roster.zipcode = postal.code;