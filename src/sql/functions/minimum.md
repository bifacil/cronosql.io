﻿---
SidebarGroup: "index-math-functions"
Autogenerated: true
---

# minimum ❇️

La función `minimum` devuelve el valor mínimo entre el un conjunto de expresiones de entrada.

Si todos los parámetros de entrada son nulos la función devuelve `NULL`

## Ejemplo

```
select minimum(1,5,3,2) AS maximumNumber;
```

El código SQL generado es el siguiente:

```
SELECT
  CASE
    WHEN 1 IS NOT NULL AND (5 IS NULL OR 1<=5) AND (3 IS NULL OR 1<=3) AND (2 IS NULL OR 1<=2) THEN 1
    WHEN 5 IS NOT NULL AND (3 IS NULL OR 5<=3) AND (2 IS NULL OR 5<=2) THEN 5
    WHEN 3 IS NOT NULL AND (2 IS NULL OR 3<=2) THEN 3
    ELSE 2
  END AS minNumber
```

El resultado es:

> 1

## Comentarios

La función `minimum` a diferencia de `min` no es una función de agregación. La función `min` actúa sobre los registros de una tabla, mientras que `minimum` sirve para buscar el valor mínimo entre las distintas columnas -o expresiones- de un mismo registro.







