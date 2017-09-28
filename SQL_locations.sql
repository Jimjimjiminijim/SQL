ALTER DATABASE dialtest SET search_path TO "$user",my_extensions,public, postgres;


CREATE TABLE tbl_locations
( loc_id  serial PRIMARY KEY,
name varchar(7) NOT NULL,
description varchar(50),
site varchar(30),
heading double precision,
species varchar(30),
elevation double precision,
CONSTRAINT uq_location_id UNIQUE (loc_id)
);


SELECT
AddGeometryColumn('tbl_locations','the_geom',4326,'POINT',2);



INSERT INTO tbl_locations (id ,name, site, heading, elevation )
VALUES (1,VM01,Ventavon, )




INSERT INTO tbl_locations(id,description, site,heading,elevation, the_geom) VALUES ('VM00','test','Ventavon',0.0,0,ST_GeomFromEWKT('SRID=4326; POINT(5.919001 44.350971 )'));
SELECT pg_terminate_backend(8820);


CREATE TABLE public.tbl_headers
( header_id serial PRIMARY KEY,
filename varchar(50),
campaign_name varchar(50),
scan_number integer,
location_name varchar(30),
species_ir  varchar(30),
species_uv varchar(30),
number_lines  double precision, 
aborted_flag  char(1),
scan_start_time  timestamp,
scan_end_time  timestamp,
CONSTRAINT uq_filename UNIQUE (filename),
CONSTRAINT uq_header_id UNIQUE (header_id)
);
