drop database shop;
create database shop;

use shop;

#添加关系表

create table if not exists 雇员信息表(
雇员编号   int    not null primary key auto_increment,
雇员姓名   text       not null,
雇员密码         char(20)   not null,
雇员电话     text       null,
工资        decimal(8,2)        null
)ENGINE=InnoDB auto_increment 10000 DEFAULT CHARSET=gb2312;#utf8mb4;

create table if not exists 会员信息表(
会员编号 	int 		not null primary key auto_increment,
姓名 		text 			not null,
密码 		char(20) 		not null,
电话 		text 			null,
积分 		int 			null
)ENGINE=InnoDB auto_increment 100000 DEFAULT CHARSET=gb2312;#utf8mb4;

create table if not exists 商品信息表(
商品编号    int    not null primary key,
名称        text        not null,
价格        decimal(8,2)         null, 
上架数量   	int    not null,
销售商      text        null
#INDEX 商品名称索引(名称),UNIQUE INDEX 商品编号索引(商品编号)
)ENGINE=InnoDB DEFAULT CHARSET=gb2312;#utf8mb4;

create table if not exists 购物车信息表(
购物车编号   int  not null primary key auto_increment,
会员编号     int  not null,
当前总价   decimal(8,2)   not null
)ENGINE=InnoDB auto_increment 1000000 DEFAULT CHARSET=gb2312;#utf8mb4;

create table if not exists 订单信息表(
订单编号   int      not null  primary key auto_increment,
会员编号   int     not null,
订单日期   datetime     not null,
最后总价   decimal(8,2)   not null,
订单状态	char(1)		not null default 'y'
)ENGINE=InnoDB auto_increment 1000000 DEFAULT CHARSET=gb2312;#utf8mb4;

create table if not exists 库存信息表(
库存编号	int		not null primary key auto_increment,
商品编号    int    not null,
库存数量    int    not null,
名称        text        not null,
价格        decimal(8,2)         null, 
销售商      text        null,
进价        decimal(8,2)        null,
雇员编号   int    not null,
进货日期   datetime     not null
)ENGINE=InnoDB auto_increment 1000000 DEFAULT CHARSET=gb2312;#utf8mb4;

create table if not exists 订单详情表(
订单编号   int      not null,
商品编号   int    not null,
购买数量    int    not null,
价格        decimal(8,2)         null
)ENGINE=InnoDB DEFAULT CHARSET=gb2312;#utf8mb4;

create table if not exists 购物车详情表(
购物车编号   int      not null,
商品编号   int    not null,
商品数量    int    not null,
价格        decimal(8,2)         null
)ENGINE=InnoDB DEFAULT CHARSET=gb2312;#utf8mb4;

#创建索引
CREATE UNIQUE INDEX 会员编号索引 ON 会员信息表(会员编号);
CREATE UNIQUE INDEX 商品编号索引 ON 商品信息表(商品编号);
CREATE UNIQUE INDEX 雇员编号索引 ON 雇员信息表(雇员编号);


#添加关系

alter table 订单信息表
add constraint FK_订单信息表_REFRENCE_会员信息表 foreign key (会员编号)
references 会员信息表(会员编号);

alter table 订单详情表
add constraint FK_订单详情表_REFRENCE_商品信息表 foreign key (商品编号)
references 商品信息表(商品编号);

alter table 订单详情表
add constraint FK_订单详情表_REFRENCE_订单信息表 foreign key (订单编号)
references 订单信息表(订单编号);

alter table 库存信息表
add constraint FK_库存信息表_REFRENCE_商品信息表 foreign key (商品编号)
references 商品信息表(商品编号);

alter table 库存信息表
add constraint FK_库存信息表_REFRENCE_雇员信息表 foreign key (雇员编号)
references 雇员信息表(雇员编号);

alter table 购物车信息表
add constraint FK_购物车信息表_REFRENCE_会员信息表 foreign key (会员编号)
references 会员信息表 (会员编号);

alter table 购物车详情表
add constraint FK_购物车详情表_REFRENCE_商品信息表 foreign key (商品编号)
references 商品信息表(商品编号);

alter table 购物车详情表
add constraint FK_购物车详情表_REFRENCE_购物车信息表 foreign key (购物车编号)
references 购物车信息表(购物车编号);


#插入数据
insert into 雇员信息表(雇员编号,雇员姓名,雇员密码,雇员电话,工资) values (null ,'张三','hhjbjkdsjkhbj' ,'110',2500);
insert into 雇员信息表(雇员编号,雇员姓名,雇员密码,雇员电话,工资) values (null,'李四','dbhvhj' ,'120',3000);

insert into 商品信息表(商品编号,名称,价格,上架数量,销售商)values('201002','方便面',2.5,100,'康帅傅');
insert into 商品信息表(商品编号,名称,价格,上架数量,销售商)values('102002','huaweiPro30',4999,25,'菊厂');
insert into 商品信息表(商品编号,名称,价格,上架数量,销售商)values('303001','羽绒服',300,30,'波4登');
insert into 商品信息表(商品编号,名称,价格,上架数量,销售商)values('200010','炸鸡',25.00,100,'金拱门');
insert into 商品信息表(商品编号,名称,价格,上架数量,销售商)values('100005','香烟',35.00,20,'中南海');
insert into 商品信息表(商品编号,名称,价格,上架数量,销售商)values('100010','毛台',400.00,20,'贵酒集团');
insert into 商品信息表(商品编号,名称,价格,上架数量,销售商)values('200011','辣椒酱',12.20,20,'老干爹');
insert into 商品信息表(商品编号,名称,价格,上架数量,销售商)values('400055','手机',1999.00,30,'大米');
insert into 商品信息表(商品编号,名称,价格,上架数量,销售商)values('200014','饼干',5.50,40,'轻食');

insert into 会员信息表(会员编号,姓名,密码,电话,积分)values(null,'李刚','223456','13029579891',0);
insert into 会员信息表(会员编号,姓名,密码,电话,积分)values(null,'陈明','323456','13019579891',1);
insert into 会员信息表(会员编号,姓名,密码,电话,积分)values(null,'陈志','423456','13719579891',2000);
insert into 会员信息表(会员编号,姓名,密码,电话,积分)values(null,'张力','523456','13729579891',666);


