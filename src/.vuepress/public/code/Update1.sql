﻿UPDATE dwh.FactSalesOrderHeader SET
  NetAmount=Amount-TaxAmt
WHERE
  year(OrderDate)=2017;