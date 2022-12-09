﻿---
SidebarGroup: "index-db-views"
---

# Crono$ForeignKeys



Devuelve información sobre todas las claves externas de la base de datos. 

Es similar a la vista `INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS`

```
select *
from Crono$ForeignKeys
```



## Comentario

Esta pseudovista es muy similar a `Crono$AnsiForeignKeys`. La diferencia es que `Crono$AnsiForeignKeys` solo llama a vistas de `INFORMATION_SCHEMA` que forman parte del estándar ANSI, por lo que puede usarse en cualquier base de datos que cumpla el estándar. En cambio `Crono$ForeignKeys` utiliza vistas o funciones de sistema que son propias de **SQL Server**.