﻿---
SidebarGroup: "index-system-functions"
Autogenerated: true
---

# newsequentialid

Crea un GUID que es mayor que cualquier GUID generado previamente por esta función en una computadora específica desde que se inició Windows. Después de reiniciar Windows, el GUID puede comenzar nuevamente desde un rango más bajo, pero aún es único globalmente. Cuando se usa una columna GUID como identificador de fila, usar NEWSEQUENTIALID puede ser más rápido que usar la función NEWID. Esto se debe a que la función NEWID genera actividad aleatoria y utiliza menos páginas de datos en caché. El uso de NEWSEQUENTIALID también ayuda a llenar completamente las páginas de datos e índices.

## Comentarios 

`newsequentialid` es una función de SQL estándar. Consulte la documentación completa de la función [`newsequentialid`](https://learn.microsoft.com/es-es/sql/t-sql/functions/newsequentialid-transact-sql) para mayor información.