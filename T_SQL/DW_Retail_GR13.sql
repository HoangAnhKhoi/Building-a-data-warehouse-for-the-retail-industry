CREATE DATABASE DW_Retail
go
USE DW_Retail

/****** Object:  Table [dbo].[Time_Stage]    Script Date: 04/05/2023 8:45:32 CH ******/
GO

CREATE TABLE [dbo].[DimTime](
	[ID_Time] [int] PRIMARY KEY,
	[OrderYear] [int] ,
	[OrderQuarter] [int] ,
	[OrderMonth] [int] ,
	[OrderDay] [int] ,
	[ShipYear] [int] ,
	[ShipQuarter] [int] ,
	[ShipMonth] [int] ,
	[ShipDay] [int] ,
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[DimShippingMode](
	[ID_ShippingMode] [int] PRIMARY KEY,
	[Days_Shipment] [int] ,
	[Shipping_Mode] [nvarchar](20) ,
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[DimMarket](
	[ID_Market] [int] PRIMARY KEY,
	[Name_Market] [nvarchar](50)
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[DimRegion](
	[ID_Region] [int] PRIMARY KEY,
	[Name_Region] [nvarchar](50),
	[ID_Market] [int]
) ON [PRIMARY]
GO
ALTER TABLE [DimRegion] ADD CONSTRAINT FK_Market FOREIGN KEY ([ID_Market]) REFERENCES [DimMarket] ([ID_Market])
GO
CREATE TABLE [dbo].[DimDepartment](
	[ID_Department] [int] PRIMARY KEY,
	[Name_Department] [nvarchar](50) 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[DimCategory](
	[ID_Category] [int] PRIMARY KEY,
	[Name_Category] [nvarchar](20) 
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[DimProduct](
	[ID_Product] [int] PRIMARY KEY,
	[Name_Product] [nvarchar](20) ,
	[Price_Product] [float] ,
	[ID_Category] [int] 
) ON [PRIMARY]
GO
ALTER TABLE [DimProduct] ADD CONSTRAINT FK_Category FOREIGN KEY ([ID_Category]) REFERENCES [DimCategory] ([ID_Category])
GO
CREATE TABLE [dbo].[DimCountry](
	[ID_Country] [int] PRIMARY KEY,
	[Name_Country] [nvarchar](100) 
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[DimCity](
	[ID_City] [int] PRIMARY KEY,
	[ID_Country] [int] ,
	[Name_State] [nvarchar](100) ,
	[Name_City] [nvarchar](50) 
) ON [PRIMARY]
GO
ALTER TABLE [DimCity] ADD CONSTRAINT FK_Country FOREIGN KEY ([ID_Country]) REFERENCES [DimCountry] ([ID_Country])
GO
CREATE TABLE [dbo].[DimSegment](
	[ID_Segment] [int] PRIMARY KEY,
	[Name_Segment] [nvarchar](50),
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[DimCustomer](
	[ID_Customer] [int] PRIMARY KEY,
	[Fname_Customer] [nvarchar](20),
	[Lname_Customer] [nvarchar](20),
	[Street_Customer] [nvarchar](50),
	[Zipcode_Customer] [nvarchar](20),
	[ID_Segment] [int] ,
	[ID_City] [int] 
) ON [PRIMARY]
GO
ALTER TABLE [DimCustomer] ADD CONSTRAINT FK_CityCus FOREIGN KEY ([ID_City]) REFERENCES [DimCity] ([ID_City])
ALTER TABLE [DimCustomer] ADD CONSTRAINT FK_Segment FOREIGN KEY ([ID_Segment]) REFERENCES [DimSegment] ([ID_Segment])
GO
CREATE TABLE [dbo].[FactSales](
	ID_Line_Order int,
	[ID_Order] [int] ,
	[ID_Customer] [int] ,
	[Type] [nvarchar](50) ,
	[Order_Status] [nvarchar](50) ,
	[ID_Product] [int] ,
	[Quantity] [int] ,
	[Discount] [float] ,
	[Sales] [float] ,
	[Item_Total] [float] ,
	[Item_Profit_Ratio] [float] ,
	[Profit_Per_Order] [float] ,
	[Product_Price] [float] ,
	[ID_Department] [int] ,
	[ID_Time] [int] ,
	[ID_City] [int] ,
	[ID_Region] [int] 
	CONSTRAINT PK_FactSales PRIMARY KEY ([ID_Order],ID_Line_Order)
) ON [PRIMARY]
GO

ALTER TABLE [FactSales] ADD CONSTRAINT FK_Customer FOREIGN KEY ([ID_Customer]) REFERENCES [DimCustomer] ([ID_Customer])
ALTER TABLE [FactSales] ADD CONSTRAINT FK_Time FOREIGN KEY ([ID_Time]) REFERENCES [DimTime] ([ID_Time])
ALTER TABLE [FactSales] ADD CONSTRAINT FK_CityOrder FOREIGN KEY ([ID_City]) REFERENCES [DimCity] ([ID_City])
ALTER TABLE [FactSales] ADD CONSTRAINT FK_Region FOREIGN KEY ([ID_Region]) REFERENCES [DimRegion] ([ID_Region])
ALTER TABLE [FactSales] ADD CONSTRAINT FK_Department FOREIGN KEY ([ID_Department]) REFERENCES [DimDepartment] ([ID_Department])
ALTER TABLE [FactSales] ADD CONSTRAINT FK_Product FOREIGN KEY ([ID_Product]) REFERENCES [DimProduct] ([ID_Product])
GO

CREATE TABLE FactDelivery(
ID_Order INT PRIMARY KEY,
Days_Shipping_Real int,
Day_For_Shipment int,
Delivery_Status [nvarchar](50),
Late_delivery_risk int,
ID_Shipping_Mode int,
[ID_Time] [int] ,
[ID_City] [int] ,
[ID_Region] [int] 
)
GO

ALTER TABLE [FactDelivery] ADD CONSTRAINT FK_TimeDe FOREIGN KEY ([ID_Time]) REFERENCES [DimTime] ([ID_Time])
ALTER TABLE [FactDelivery] ADD CONSTRAINT FK_CityOrderDe FOREIGN KEY ([ID_City]) REFERENCES [DimCity] ([ID_City])
ALTER TABLE [FactDelivery] ADD CONSTRAINT FK_RegionDe FOREIGN KEY ([ID_Region]) REFERENCES [DimRegion] ([ID_Region])
ALTER TABLE [FactDelivery] ADD CONSTRAINT FK_ShippingDe FOREIGN KEY ([ID_Shipping_Mode]) REFERENCES [DimShippingMode] ([ID_ShippingMode])