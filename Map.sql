-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'dial_scan_location'
-- 
-- ---

DROP TABLE IF EXISTS `dial_scan_location`;
		
CREATE TABLE `dial_scan_location` (
  `scan_id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `location_name` VARCHAR NULL AUTO_INCREMENT DEFAULT NULL,
  `description` MEDIUMTEXT NULL DEFAULT NULL,
  `dial_heading` DOUBLE NULL DEFAULT NULL,
  `laser_los` DOUBLE NULL DEFAULT NULL,
  `dial_coordinates` INTEGER NULL DEFAULT NULL,
  `wind_direction` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`scan_id`)
);

-- ---
-- Table 'wind_data'
-- 
-- ---

DROP TABLE IF EXISTS `wind_data`;
		
CREATE TABLE `wind_data` (
  `wind_data_id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `scan_id` INTEGER NULL DEFAULT NULL,
  `mast` MEDIUMTEXT NULL DEFAULT NULL,
  `direction` DOUBLE NULL DEFAULT NULL,
  `mast_coordinates` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`wind_data_id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `wind_data` ADD FOREIGN KEY (scan_id) REFERENCES `dial_scan_location` (`scan_id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `dial_scan_location` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `wind_data` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `dial_scan_location` (`scan_id`,`location_name`,`description`,`dial_heading`,`laser_los`,`dial_coordinates`,`wind_direction`) VALUES
-- ('','','','','','','');
-- INSERT INTO `wind_data` (`wind_data_id`,`scan_id`,`mast`,`direction`,`mast_coordinates`) VALUES
-- ('','','','','');