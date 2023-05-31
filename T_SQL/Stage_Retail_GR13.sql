CREATE DATABASE Stage_Retail
GO
USE Stage_Retail
GO

CREATE TABLE [dbo].[Category_Stage](
	[ID_Category] [int] NULL,
	[Name_Category] [nvarchar](20) NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[City_Stage](
	[ID_City] [int] NULL,
	[ID_Country] [int] NULL,
	[Name_State] [nvarchar](100) NULL,
	[Name_City] [nvarchar](50) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Country_Stage](
	[Name_Country] [nvarchar](100) NULL,
	[ID_Country] [int] NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Customer_Stage](
	[ID_Customer] [int] NULL,
	[Fname_Customer] [nvarchar](20) NULL,
	[Lname_Customer] [nvarchar](20) NULL,
	[Street_Customer] [nvarchar](50) NULL,
	[Zipcode_Customer] [nvarchar](20) NULL,
	[ID_Segment] [int] NULL,
	[ID_City] [int] NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Delivery_Stage](
	[ID_Order] [int] NULL,
	[Days_Shipping_Real] [int] NULL,
	[Day_For_Shipment] [int] NULL,
	[Delivery_Status] [nvarchar](50) NULL,
	[Late_delivery_risk] [int] NULL,
	[ID_Shipping_Mode] [int] NULL,
	[ID_Time] [int] NULL,
	[ID_City] [int] NULL,
	[ID_Region] [int] NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Department_Stage](
	[ID_Department] [int] NULL,
	[Name_Department] [nvarchar](50) NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Market_Stage](
	[Name_Market] [nvarchar](50) NULL,
	[ID_Market] [int] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Product_Stage](
	[Price_Product] [float] NULL,
	[Name_Product] [nvarchar](20) NULL,
	[ID_Product] [int] NULL,
	[ID_Category] [int] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Region_Stage](
	[Name_Region] [nvarchar](50) NULL,
	[ID_Region] [int] NULL,
	[ID_Market] [int] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Segment_Stage](
	[Name_Segment] [nvarchar](50) NULL,
	[ID_Segment] [int] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Time_Stage](
	[OrderYear] [int] NULL,
	[OrderQuarter] [int] NULL,
	[OrderMonth] [int] NULL,
	[OrderDay] [int] NULL,
	[ShipYear] [int] NULL,
	[ShipQuarter] [int] NULL,
	[ShipMonth] [int] NULL,
	[ShipDay] [int] NULL,
	[OrderShip] [nvarchar](100) NULL,
	[ID_Time] [int] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Shipping_Mode_Stage](
	[Days_shipment] [int] NULL,
	[Shipping_Mode] [nvarchar](20) NULL,
	[ID] [int] NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Sales_Stage](
	[ID_Line_Order] [int] NULL,
	[ID_Order] [int] NULL,
	[ID_Customer] [int] NULL,
	[Type] [nvarchar](50) NULL,
	[Order_Status] [nvarchar](50) NULL,
	[ID_Product] [int] NULL,
	[Quantity] [int] NULL,
	[Discount] [float] NULL,
	[Sales] [float] NULL,
	[Item_Total] [float] NULL,
	[Item_Profit_Ratio] [float] NULL,
	[Profit_Per_Order] [float] NULL,
	[Product_Price] [float] NULL,
	[ID_Department] [int] NULL,
	[ID_Time] [int] NULL,
	[ID_City] [int] NULL,
	[ID_Region] [int] NULL
) ON [PRIMARY]
GO


