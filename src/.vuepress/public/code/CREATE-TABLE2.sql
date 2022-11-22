﻿IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dwh' AND TABLE_NAME='DimCustomers' AND TABLE_TYPE='BASE TABLE')
DROP TABLE dwh.DimCustomers


CREATE TABLE dwh.DimCustomers(
  CustomerSid int IDENTITY(1,1),
  CustomerId int NOT NULL,
  Customer nvarchar(101) NOT NULL,
  CustomerType varchar(6) NOT NULL,
  AccountNumber nvarchar(10),
  FirstName nvarchar(50),
  MiddleName nvarchar(50),
  LastName nvarchar(50),
  CustomerAddressCountry nvarchar(50),
  CustomerProvince nvarchar(50),
  Name nvarchar(50),
  CustomerCountry nvarchar(50),
  CONSTRAINT PK_DimCustomers PRIMARY KEY CLUSTERED (CustomerSid),
  CONSTRAINT BK_DimCustomers UNIQUE (CustomerId)
)