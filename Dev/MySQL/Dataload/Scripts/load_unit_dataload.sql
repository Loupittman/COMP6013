LOAD DATA
    INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\load_unit.csv'
    INTO TABLE load_unit
    FIELDS TERMINATED BY ',' optionally ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
	IGNORE 1 LINES