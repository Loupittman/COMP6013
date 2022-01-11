LOAD DATA
    INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\component.csv'
    INTO TABLE `component`
    FIELDS TERMINATED BY ',' optionally ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
	IGNORE 1 LINES