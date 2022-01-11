LOAD DATA
    INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\haulier.csv'
    INTO TABLE haulier
    FIELDS TERMINATED BY ',' optionally ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
	IGNORE 1 LINES
	(@id, @haulier)
	SET
		id = @id,
		haulier = NULLIF(@haulier,'')