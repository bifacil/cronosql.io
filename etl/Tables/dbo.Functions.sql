﻿
CREATE OR REPLACE PROCEDURE
MERGE CLONE dbo.Functions(idFunction)
select  top 1 over (partition by FunctionName order by FunctionType)
	Name #FunctionName,
	expr2 FunctionType, 
	issues.BodyMarkdown Body
from Crono$Functions
left join @@github.Issues filter (repositoryname='cronosql.io') using (name title)
