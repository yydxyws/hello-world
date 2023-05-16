use shop;

DROP PROCEDURE if exists 选购;

DELIMITER $$
CREATE PROCEDURE 选购(IN 购物车编号参数 int,IN 会员编号参数 int,IN 商品编号参数 int,IN 商品数量参数 int) 
BEGIN
    DECLARE 价格参数 DECIMAL(8,2); 
	DECLARE 当前总价参数 DECIMAL(8,2); 

    #SELECT 会员编号 INTO 会员编号参数 FROM 会员信息表 WHERE 会员编号 = 会员编号参数;
	SELECT 价格 INTO 价格参数 FROM 商品信息表 WHERE 商品编号 = 商品编号参数;
    
	INSERT INTO 购物车详情表 VALUES(购物车编号参数,商品编号参数,商品数量参数,价格参数);
	
    SELECT SUM(商品数量参数 * 价格参数) as 当前总价参数 FROM 购物车详情表 where 购物车编号=购物车编号参数;

    INSERT INTO 购物车信息表 VALUES(购物车编号参数,会员编号参数,商品数量参数,当前总价参数);
END$$
DELIMITER ;
