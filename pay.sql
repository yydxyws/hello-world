use shop;

DROP PROCEDURE if exists 付款;

DELIMITER $$
CREATE PROCEDURE 付款(IN 购物车编号参数 int,IN 雇员编号参数 int) 
BEGIN
	DECLARE 会员编号参数 int; 
    DECLARE 商品编号参数 int; 
	DECLARE 订单编号参数 int; 
	DECLARE 商品数量参数 int; 
    DECLARE 订单日期参数 DATETIME; 
    DECLARE 商品价格参数 DECIMAL(8,2); 
	DECLARE 当前总价参数 DECIMAL(8,2); 

    SELECT 会员编号, 当前总价 INTO 会员编号参数, 当前总价参数 FROM 购物车信息表 WHERE 购物车编号 = 购物车编号参数;
	SELECT 商品编号, 商品数量 INTO 商品编号参数, 商品数量参数 FROM 购物车详情表 WHERE 购物车编号 = 购物车编号参数;
    
    #从购物车创立订单
    INSERT INTO 订单信息表 VALUES(订单编号参数=null,会员编号参数,雇员编号参数,CURRENT_TIMESTAMP(),当前总价参数,'y');
    INSERT INTO 订单详情表 VALUES(订单编号参数,商品编号参数,商品数量参数,商品价格参数);
    
    # 更新商品库存
    UPDATE 商品信息表 SET 上架数量 = 上架数量 -商品数量参数 WHERE 商品编号 = 商品编号参数;
    # 更新会员积分
	UPDATE 会员信息表 SET 积分 = 积分 + (当前总价参数 *0.1) WHERE 会员编号 = 会员编号参数;    
END$$
DELIMITER ;
