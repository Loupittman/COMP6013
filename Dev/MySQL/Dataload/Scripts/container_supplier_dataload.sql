LOAD DATA
    INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\container_supplier.csv'
    INTO TABLE container_supplier
    FIELDS TERMINATED BY ',' optionally ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
	IGNORE 1 LINES