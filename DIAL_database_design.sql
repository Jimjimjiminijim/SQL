CREATE TABLE "MATLAB Scan Variables" (
"Scan"  SERIAL ,
PRIMARY KEY ("Scan")
);
COMMENT ON TABLE "MATLAB Scan Variables" IS 'Contains all MATLAB variables associated with the data processing and analysis of each individual scan.';

CREATE TABLE "DIAL Campaigns" (
"Camp_id"  SERIAL ,
"Date of Campaign" DATE ,
"Site Name" TEXT ,
"Site Geometry" GEOMETRY /* Will provide info for GIS location of site */,
PRIMARY KEY ("Camp_id")
);
COMMENT ON TABLE "DIAL Campaigns" IS 'Contains campaign information. This is the top level table.';
COMMENT ON COLUMN "DIAL Campaigns"."Site Geometry" IS 'Will provide info for GIS location of site';

CREATE TABLE "DIAL Location" (
"id"  SERIAL ,
PRIMARY KEY ("id")
);

