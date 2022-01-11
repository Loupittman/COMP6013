LOAD DATA
    INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\supplier.csv'
    INTO TABLE supplier
    FIELDS TERMINATED BY ',' optionally ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
	IGNORE 1 LINES
    (@id, @`code`, @`name`, @address, @contact, @country)
	SET
		id = @id,
		`code` = NULLIF(@`code`,''),
		`name` = NULLIF(@`name`,''),
		address = NULLIF(@address,''),
		contact = NULLIF(@contact,''),
		country = NULLIF(@country,'')