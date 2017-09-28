CREATE TABLE "MATLAB Scan Variables" (
"Scan"  SERIAL ,
PRIMARY KEY ("Scan")
);
COMMENT ON TABLE "MATLAB Scan Variables" IS 'Contains all MATLAB variables associated with the data processing and analysis of each individual scan.';

CREATE TABLE "DIAL Campaigns" (
"Camp_id"  SERIAL ,
"Site Name" TEXT ,
"Date of Campaign" DATE ,
PRIMARY KEY ("Camp_id")
);
COMMENT ON TABLE "DIAL Campaigns" IS 'Contains campaign information. This is the top level table.';

CREATE TABLE "new table" (
"id"  SERIAL ,
PRIMARY KEY ("id")
);

