-- ---
-- Globals
-- ---
CREATE DATABASE scanDatDB
-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'scanDat_data'
-- 
-- ---

DROP TABLE IF EXISTS `scanDat_data`;
		
CREATE TABLE `scanDat_data` (
  `scan_number` INTEGER NULL DEFAULT NULL,
  `scanDat_filename` VARCHAR NULL DEFAULT NULL,
  `status` VARCHAR NULL DEFAULT NULL,
  `number_of_scan_lines` INTEGER NULL DEFAULT NULL,
  `user` VARCHAR NULL DEFAULT NULL,
  `gpw_w` DOUBLE NULL DEFAULT NULL,
  `alt` DOUBLE NULL DEFAULT NULL,
  `id` DOUBLE NULL DEFAULT NULL,
  `gps_n` DOUBLE NULL DEFAULT NULL,
  `site_name` VARCHAR NULL DEFAULT NULL,
  `location_name` VARCHAR NULL DEFAULT NULL,
  `description` VARCHAR NULL DEFAULT NULL,
  `dial_heading` DOUBLE NULL DEFAULT NULL,
  `numeric` DOUBLE NULL DEFAULT NULL,
  `lpms_x` DOUBLE NULL DEFAULT NULL,
  `lpms_y` DOUBLE NULL DEFAULT NULL,
  `lpms_z` DOUBLE NULL DEFAULT NULL,
  `species_1` VARCHAR NULL DEFAULT NULL,
  `coefficient_1` DOUBLE NULL DEFAULT NULL,
  `species_2` VARCHAR NULL DEFAULT NULL,
  `coefficient_2` DOUBLE NULL DEFAULT NULL,
  `scan_start` DATETIME NULL DEFAULT NULL,
  `scan_end` DATETIME NULL DEFAULT NULL,
  `hardware_status_licel` INTEGER NULL DEFAULT NULL,
  `hardware_status_gps` INTEGER NULL DEFAULT NULL,
  `hardware_status_lmps` INTEGER NULL DEFAULT NULL,
  `hardware_status_scanner` INTEGER NULL DEFAULT NULL,
  `hardware_status_ancil` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`scan_number`)
);

-- ---
-- Table 'scanDat_global'
-- 
-- ---

DROP TABLE IF EXISTS `scanDat_global`;
		
CREATE TABLE `scanDat_global` (
  `site_name` VARCHAR NULL AUTO_INCREMENT DEFAULT NULL,
  `software_version` DOUBLE NULL DEFAULT NULL,
  `magnetic_correction` DOUBLE NULL DEFAULT NULL,
  `campaign_root_dir` VARCHAR NULL DEFAULT NULL,
  `campaign_name` VARCHAR NULL DEFAULT NULL,
  `scan_results` VARCHAR NULL DEFAULT NULL,
  `power_results` VARCHAR NULL DEFAULT NULL,
  `header_folder` VARCHAR NULL DEFAULT NULL,
  `background_file` VARCHAR NULL DEFAULT NULL,
  `background_file_active` INTEGER NULL DEFAULT NULL,
  `scanner_dwell_time_AZI` INTEGER NULL DEFAULT NULL,
  `scanner_dwell_time_ELEV` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`site_name`)
);

-- ---
-- Table 'scanDat_lines'
-- 
-- ---

DROP TABLE IF EXISTS `scanDat_lines`;
		
CREATE TABLE `scanDat_lines` (
  `line_number` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `scan_number` INTEGER NULL DEFAULT NULL,
  `line_started` DATETIME NULL DEFAULT NULL,
  `line_finished` DATETIME NULL DEFAULT NULL,
  `licel_measurement_file_name` DOUBLE NULL DEFAULT NULL,
  `cell_uv_on` DOUBLE NULL DEFAULT NULL,
  `cell_uv_off` DOUBLE NULL DEFAULT NULL,
  `cell_ir_on` DOUBLE NULL DEFAULT NULL,
  `cell_ir_off` DOUBLE NULL DEFAULT NULL,
  `ref_uv_on` DOUBLE NULL DEFAULT NULL,
  `ref_uv_off` DOUBLE NULL DEFAULT NULL,
  `ref_ir_on` DOUBLE NULL DEFAULT NULL,
  `ref_ir_off` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`line_number`)
);

-- ---
-- Table 'scanDat_scan_table'
-- 
-- ---

DROP TABLE IF EXISTS `scanDat_scan_table`;
		
CREATE TABLE `scanDat_scan_table` (
  `line_number` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `scan_number` INTEGER NULL DEFAULT NULL,
  `azimuth` DOUBLE NULL DEFAULT NULL,
  `elevation` INTEGER NULL DEFAULT NULL,
  `shots` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`line_number`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `scanDat_data` ADD FOREIGN KEY (site_name) REFERENCES `scanDat_global` (`site_name`);
ALTER TABLE `scanDat_lines` ADD FOREIGN KEY (line_number) REFERENCES `scanDat_scan_table` (`line_number`);
ALTER TABLE `scanDat_lines` ADD FOREIGN KEY (scan_number) REFERENCES `scanDat_data` (`scan_number`);
ALTER TABLE `scanDat_scan_table` ADD FOREIGN KEY (scan_number) REFERENCES `scanDat_data` (`scan_number`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `scanDat_data` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `scanDat_global` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `scanDat_lines` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `scanDat_scan_table` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `scanDat_data` (`scan_number`,`scanDat_filename`,`status`,`number_of_scan_lines`,`user`,`gpw_w`,`alt`,`id`,`gps_n`,`site_name`,`location_name`,`description`,`dial_heading`,`numeric`,`lpms_x`,`lpms_y`,`lpms_z`,`species_1`,`coefficient_1`,`species_2`,`coefficient_2`,`scan_start`,`scan_end`,`hardware_status_licel`,`hardware_status_gps`,`hardware_status_lmps`,`hardware_status_scanner`,`hardware_status_ancil`) VALUES
-- ('','','','','','','','','','','','','','','','','','','','','','','','','','','','');
-- INSERT INTO `scanDat_global` (`site_name`,`software_version`,`magnetic_correction`,`campaign_root_dir`,`campaign_name`,`scan_results`,`power_results`,`header_folder`,`background_file`,`background_file_active`,`scanner_dwell_time_AZI`,`scanner_dwell_time_ELEV`) VALUES
-- ('','','','','','','','','','','','');
-- INSERT INTO `scanDat_lines` (`line_number`,`scan_number`,`line_started`,`line_finished`,`licel_measurement_file_name`,`cell_uv_on`,`cell_uv_off`,`cell_ir_on`,`cell_ir_off`,`ref_uv_on`,`ref_uv_off`,`ref_ir_on`,`ref_ir_off`) VALUES
-- ('','','','','','','','','','','','','');
-- INSERT INTO `scanDat_scan_table` (`line_number`,`scan_number`,`azimuth`,`elevation`,`shots`) VALUES
-- ('','','','','');