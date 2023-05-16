use shop;

DROP PROCEDURE if exists 下架;

DELIMITER $$
CREATE PROCEDURE 下架(IN 商品编号参数 int) 
BEGIN
    DECLARE 上架数量参数 int;
	DECLARE 库存数量参数 int;

    SELECT 上架数量 INTO 上架数量参数 FROM 商品信息表 WHERE 商品编号 = 商品编号参数;
	SELECT 库存数量 INTO 库存数量参数 FROM 库存信息表 WHERE 商品编号 = 商品编号参数;
	UPDATE 商品信息表 SET 上架数量 = 0 WHERE 商品编号 = 商品编号参数;
	UPDATE 库存信息表 SET 库存数量 =库存数量参数+上架数量参数 WHERE 商品编号 = 商品编号参数;
END$$
DELIMITER ;
