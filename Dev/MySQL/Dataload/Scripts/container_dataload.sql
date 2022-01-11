LOAD DATA
    INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\container.csv'
    INTO TABLE container
    FIELDS TERMINATED BY ',' optionally ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
	IGNORE 1 LINES
    (@id, @container_id, @`type`, @`description`, @vle, @model_mix, @empties_storage, @empties_lane, @jis_route, @`length`, @width, @height, @weight, @haulier_id, @load_unit_id)
	SET
		id = @id,
		container_id = @container_id,
		`type` = NULLIF(@`type`,''),
		`description` = NULLIF(@`description`,''),
		vle = NULLIF(@vle,''),
		model_mix = NULLIF(@model_mix,''),
		empties_storage = NULLIF(@empties_storage,''),
		empties_lane = NULLIF(@empties_lane,''),
		jis_route = NULLIF(@jis_route,''),
		`length` = NULLIF(@`length`,''),
		width = NULLIF(@width,''),
		height = NULLIF(@height,''),
		weight = NULLIF(@weight,''),
		haulier_id = NULLIF(@haulier_id,''),
		load_unit_id = NULLIF(@load_unit_id,'')