use shop;

DROP PROCEDURE if exists 入库;

DELIMITER $$
CREATE PROCEDURE 入库
(IN 库存编号参数 int,IN 商品编号参数 int,IN 销售商参数 TEXT,IN 名称参数 TEXT,IN 价格参数 DECIMAL(8,2),IN 库存数量参数 INT,IN 进价参数 DECIMAL(8,2),IN 雇员编号参数 CHAR(10)) 
BEGIN
	DECLARE 进货日期参数 datetime; 
	declare num int;
    
    select count(*) into num from 库存信息表 where 商品编号 = 商品编号参数;
    if num=0 then
		INSERT INTO 库存信息表 VALUES(库存编号参数,商品编号参数,库存数量参数,名称参数,价格参数,销售商参数,进价参数,雇员编号参数,CURRENT_TIMESTAMP());
    ELSE
		UPDATE 库存信息表 SET 库存数量 = 库存数量 + 库存数量参数 WHERE 商品编号 = 商品编号参数;
    END IF;
      
END$$
DELIMITER ;
