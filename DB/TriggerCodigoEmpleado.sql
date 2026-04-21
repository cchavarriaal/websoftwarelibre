USE `planillasweb`;

DELIMITER //

DROP TRIGGER IF EXISTS `tg_empleado_codigo_auto` //

CREATE TRIGGER `tg_empleado_codigo_auto` BEFORE INSERT ON `empleados`
FOR EACH ROW
BEGIN
    DECLARE next_id INT;
    
    -- Si el código viene vacío, nulo o con el texto temporal del frontend
    IF NEW.codigo_empleado IS NULL OR NEW.codigo_empleado = '' OR NEW.codigo_empleado = 'Generando...' THEN
        
        -- Buscamos cuál será el próximo ID automático de esta tabla
        SELECT AUTO_INCREMENT INTO next_id
        FROM information_schema.tables
        WHERE table_name = 'empleados' AND table_schema = DATABASE();
        
        -- Por seguridad, si no lo encuentra (tabla vacía), inicia en 1
        IF next_id IS NULL THEN
            SET next_id = 1;
        END IF;

        -- Armamos el código final: EMP- + AÑO + ID (con ceros a la izquierda)
        SET NEW.codigo_empleado = CONCAT('EMP-', YEAR(CURDATE()), LPAD(next_id, 3, '0'));
        
    END IF;
END;
//

DELIMITER ;
