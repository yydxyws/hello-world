use shop;

DROP PROCEDURE if exists 退款;

DELIMITER $$
CREATE PROCEDURE 退款(IN 订单编号参数 int) 
BEGIN
    DECLARE 商品编号参数 int; 
	DECLARE 购买数量参数 int; 
	DECLARE 最后总价参数 DECIMAL(8,2);
	DECLARE 商品价格参数 DECIMAL(8,2);
	DECLARE 会员编号参数 int; 

    SELECT 商品编号, 购买数量 INTO 商品编号参数, 购买数量参数 FROM 订单详情表 WHERE 订单编号 = 订单编号参数;
    SELECT 会员编号,最后总价 INTO 会员编号参数,最后总价参数 FROM 订单信息表 WHERE 订单编号 = 订单编号参数;
    
    # 更新商品库存
    UPDATE 商品信息表 SET 上架数量 = 上架数量 + 购买数量参数 WHERE 商品编号 = 商品编号参数;
    # 更新顾客积分
	UPDATE 会员信息表 SET 积分 = 积分 - (最后总价参数* 0.1) WHERE 会员编号 = 会员编号参数;
    # 更新订单商品处理进度
    UPDATE 订单信息表 SET 订单状态 = 'n',订单日期 = CURRENT_TIMESTAMP() WHERE 订单编号 = 订单编号参数; 
    
END$$
DELIMITER ;