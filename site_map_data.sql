-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Site_Map_Data'
-- A basic table containing everything needed to populate a map with DIAL truck locations, LOS and wind direction
-- ---

DROP TABLE IF EXISTS Site_Map_Data;
		
CREATE TABLE Site_Map_Data (
  id INTEGER,
  Location_Name VARCHAR(8) NULL DEFAULT NULL,
  Location_Geometry_Coordinates GEOMETRY NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Table 'Wind_Data'
-- 
-- ---

DROP TABLE IF EXISTS Wind_Data;
		
CREATE TABLE Wind_Data (
  DIAL_Location_id INTEGER NULL DEFAULT NULL,
  Wind_Mast_Name VARCHAR(10) NULL DEFAULT NULL,
  Wind_Sensor VARCHAR(10) NULL DEFAULT NULL,
  Wind_Mast_Location_Geometry_Coordinates VARCHAR NULL DEFAULT NULL,
  Average_Wind_Direction NUMERIC NULL DEFAULT NULL
);

-- ---
-- Table 'DIAL_Location_Information'
-- 
-- ---

DROP TABLE IF EXISTS DIAL_Location_Information;
		
CREATE TABLE DIAL_Location_Information (
  Location_id INTEGER DEFAULT NULL,
  Location_Description VARCHAR NULL DEFAULT NULL,
  Line_of_Sight NUMERIC NULL DEFAULT NULL
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE Wind_Data ADD FOREIGN KEY (DIAL_Location_id) REFERENCES Site_Map_Data (id);
ALTER TABLE DIAL_Location_Information ADD FOREIGN KEY (Location_id) REFERENCES Site_Map_Data (id);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Site_Map_Data` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Wind_Data` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `DIAL_Location_Information` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---
insert into site_map_data (id, location_name,Location_Geometry_Coordinates) 
values (1, 'BV01', (select the_geom from tbl_locations where loc_id = 1));


insert into site_map_data (id, location_name,Location_Geometry_Coordinates) 
values ((select loc_id from tbl_locations),
 (select name from tbl_locations),
 (select the_geom from tbl_locations))
 where loc_id < 15;


-- INSERT INTO `Site_Map_Data` (`id`,`Location_Name`,`Location_Geometry_Coordinates`) VALUES
-- ('','','');
-- INSERT INTO `Wind_Data` (`DIAL_Location_id`,`Wind_Mast_Name`,`Wind_Sensor`,`Wind_Mast_Location_Geometry_Coordinates`,`Average_Wind_Direction`) VALUES
-- ('','','','','');
-- INSERT INTO `DIAL_Location_Information` (`Location_id`,`Location_Description`,`Line_of_Sight`) VALUES
-- ('','','');