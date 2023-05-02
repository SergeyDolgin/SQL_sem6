CREATE DATABASE sem6_functions;

USE sem6_functions;

DELIMITER //
CREATE FUNCTION date_out(a INT) RETURNS VARCHAR(50)
	DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(50);
	DECLARE day_res INT;
    DECLARE hours_res INT;
    DECLARE minuts_res INT;
    DECLARE second_res INT;

	SET day_res = FLOOR(a / 86400);
    SET a = a % 86400;
    SET hours_res = FLOOR(a / 3600);
    SET a = a % 3600;
    SET minuts_res = FLOOR(a / 60);
    SET second_res = a % 60;

	SET result = CONCAT(day_res, ' days ', hours_res, '  hours ', minuts_res, ' minutes ', second_res, ' seconds'); 

 RETURN (result);
END //

SELECT date_out(123456) AS result;


# Задание 2
DELIMITER //
CREATE FUNCTION even_out() RETURNS VARCHAR(50)
	DETERMINISTIC
BEGIN
	DECLARE i INT DEFAULT 2;
    DECLARE result VARCHAR(50) DEFAULT '';

	WHILE i < 12 DO
		SET result = CONCAT_WS(' ', result, i);
		SET i = i + 2;
	END WHILE;


	RETURN result;
END //

SELECT even_out() AS result;

