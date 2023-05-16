use shop;

DROP PROCEDURE if exists 上架;

DELIMITER $$
CREATE PROCEDURE 上架(IN 商品编号参数 int,IN 上架数量参数 INT) 
BEGIN
	DECLARE 名称参数 text; 
	DECLARE 销售商参数 text; 
	DECLARE 价格参数 DECIMAL(8,2);
    
	declare num int;
    select count(*) into num from 商品信息表 where 商品编号 = 商品编号参数;
    
    SELECT 价格, 名称, 销售商 INTO 价格参数, 名称参数, 销售商参数 FROM 库存信息表 WHERE 商品编号 = 商品编号参数;
    
    if num=0 then
		INSERT INTO 商品信息表 VALUES(商品编号参数,名称参数,价格参数,上架数量参数,销售商参数);
    ELSE
		UPDATE 商品信息表 SET 上架数量 = 上架数量 + 上架数量参数 WHERE 商品编号 = 商品编号参数;
    END IF;
      
END$$
DELIMITER ;
