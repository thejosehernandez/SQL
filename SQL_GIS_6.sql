# SQL for GIS

#NEED TO LOAD SHAPEFILES TO POSTGRESQL FIRST
#USE POSTGIS 2.0 SHAPEFILE AND DBF LOADER


############### SAVE BOTH AS VIEW IN POSTGRESQL ###############

#CRITERIA FOR THE COUNTIES TABLE
SELECT *
FROM lab6.counties
WHERE counties.no_farms87 > 500 AND counties.age_18_64 > 25000 AND counties.pop_sqmile < 150;

#CRITERIA FOR THE CITIES TABLE
SELECT *
FROM lab6.cities
WHERE cities.crime_inde <= 0.02 and cities.university = 1;

############### SAVE BOTH AS VIEW IN POSTGRESQL ###############

################# SAVE AS VIEW IN POSTGRESQL ##################
#CITIES WITHIN COUNTIES CRITERIA
SELECT viewcities.name, viewcities.geom
FROM lab6.viewcities, lab6.viewcounties
WHERE ST_Within(viewcities.geom, viewcounties.geom);
################# SAVE AS VIEW IN POSTGRESQL ##################

################# SAVE AS VIEW IN POSTGRESQL ##################
#VIEW USED FOR MORE CIRITERIA
SELECT DISTINCT result.name, result.geom
FROM lab6.result, lab6.interstates
WHERE st_dwithin(st_transform(interstates.geom, 2271), st_transform(result.geom, 2260), (5280 * 20));
################# SAVE AS VIEW IN POSTGRESQL ##################

################# SAVE AS VIEW IN POSTGRESQL ##################
#LAST CITIES CRITERIA
SELECT DISTINCT result2.name, result2.geom
FROM lab6.result2, lab6.recareas
WHERE st_dwithin(st_transform(recareas.geom, 2271), st_transform(result2.geom, 2260), (5280 * 10));
################# SAVE AS VIEW IN POSTGRESQL ##################