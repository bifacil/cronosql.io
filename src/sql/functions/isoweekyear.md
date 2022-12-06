﻿---
SidebarGroup: "index-date-functions"
Autogenerated: true
---

# isoweekyear ❇️

La función  `isoweekyear` devuelve el año de la semana ISO de una fecha determinada.

La norma ISO 8601 establece que una semana inicia el día lunes y termina el día domingo. Además, esta norma indica que la primera semana del año es aquella que contenga el primer día jueves del año. El resto de semanas del año se numeran consecutivamente hasta completar 52 o 53 semanas de 7 días exactamente.

## Ejemplo

```
select isoweekyear('2022-11-26') as isoyear,isoweek('2022-11-26') as week;
select isoweekyear('2022-01-01') as isoyear,isoweek('2022-01-01') as week;
```

El código SQL generado es:

```
SELECT year('2022-11-26')+CASE WHEN month('2022-11-26')=1 AND datepart(isowk,'2022-11-26')>50 THEN -1 WHEN month('2022-11-26')=12 AND datepart(isowk,'2022-11-26')=1 THEN 1 ELSE 0 END AS isoyear, datepart(isowk,'2022-11-26') AS week
SELECT year('2022-01-01')+CASE WHEN month('2022-01-01')=1 AND datepart(isowk,'2022-01-01')>50 THEN -1 WHEN month('2022-01-01')=12 AND datepart(isowk,'2022-01-01')=1 THEN 1 ELSE 0 END AS isoyear, datepart(isowk,'2022-01-01') AS week
```

## Comentarios

El año de la semana ISO de una fecha no coincide necesariamente con el año de esa fecha. Por ejemplo, el 1 de enero de 2022 corresponde a la semana 52 del año 2021. Por este motivo es necesario agrupar o filtrar utilizando la función `isoweekyear` para seleccionar sin ambigüedad semanas ISO completas.


