---
sidebarDepth: 2
---




# Sentencia SELECT ❤️

En esta sección se documenta el funcionamiento de la sentencia **SELECT** del lenguaje. La sintaxis **SELECT** de **Crono SQL** aporta algunas ventajas (algunas importantes) frente al SQL ISO. Sin embargo, el mayor beneficio del lenguaje se manifiesta en el resto de instrucciones DML (**INSERT**, **UPDATE**, **MERGE**, …), donde Crono SQL automatiza toda la lógica de carga. Por eso la sentencia **SELECT** es tan importante… ¡Es prácticamente lo único que tendrá que codificar el desarrollador de un proyecto  ETL/DWH!

A continuación se describen sistemáticamente todas las características soportadas en la sentencia **SELECT** del lenguaje **Crono SQL**.



## Basado en el lenguaje SQL 


**Proposición:** Cualquier sentencia **SELECT** válida en SQL es válida también en **Crono SQL**

<view-sql-code fileName="SelectHelloWorld"/>

Si ninguna tabla participa en la consulta, se debe terminar la sentencia con el carácter punto y coma ";". En cualquier otro caso, el punto y coma es opcional.

<view-sql-code fileName="SelectAsterisk"/>

Se pueden incluir las cláusulas **JOIN**, **WHERE**, **GROUP BY**, **HAVING** y/o **ORDER BY**

<view-sql-code fileName="SelectFull"/>

Se pueden utilizar las funciones propias del motor de base de datos o funciones definidas por el usuario.

<view-sql-code fileName="DatabaseFunctions"/>

## Referencia a columnas existentes

A diferencia del SQL ISO, en **Crono SQL** se puede hacer referencia a otra columna de la sentencia SELECT mediante el Alias de la columna.

<view-sql-code fileName="ColumnReuse"/>

## Prescindiendo del GROUP BY

Se puede utilizar la cláusula **GROUP BY ALL** para indicar que se agrupe por todas las columnas que no sean funciones de agregación. 

<view-sql-code fileName="GroupByAll"/>

Siempre se puede prescindir totalmente de la cláusula **GROUP BY**. **Crono SQL** incluirá las columnas necesarias en el SQL generado.

<view-sql-code fileName="NoGroupBy"/>

## USING

Se puede utilizar la cláusula **USING**  para simplificar la sintaxis de los JOIN equi-join.

<view-sql-code fileName="Using1"/>

La cláusula **USING** también puede utilizarse cuando los campos de la equi-join tienen distinto nombre.

<view-sql-code fileName="Using2"/>

Si no se especifica el nombre de la tabla izquierda en la cláusula **USING**, se asume que es la tabla del **FROM** es la que participa en la relación. 

<view-sql-code fileName="Using3"/>

Si la relación equi-join está formada por distintos campos, se pueden especificar en la cláusula **USING** separados por comas.

<view-sql-code fileName="Using4"/>

## CHECK SNOWFLAKE

La cláusula **CHECK SNOWFLAKE**, colocada justo después de todos los **JOINs**, verifica que las relaciones no pierden ni duplican ningún registro de la tabla del **FROM**. Se trata de una comprobación fundamental para validar que no estamos cometiendo ninguna equivocación al escribir la consulta y que los datos de origen son coherentes con lo esperado.

<view-sql-code fileName="CheckSnowflake"/>

La cláusula **CHECK SNOWFLAKE** verifica que todas las ventas correspondan a un cliente y que ese cliente exista en la tabla de personas. Si no fuera así, la consulta no se ejecutaría y devolvería un error.

   

## Subconsultas

Se pueden incluir subconsultas.

<view-sql-code fileName="Subqueries"/>

## Subconsultas con FILTER y COLUMNS

Después del nombre de la tabla, se puede incluir la cláusula **FILTER** para seleccionar solo una parte de los registros de la tabla. El código SQL generado incluirá una subconsulta similar a la del Ejemplo anterior.

<view-sql-code fileName="FilterSentence"/>


La cláusula **FILTER** es muy útil en combinación con la cláusula **CHECK SNOWFLAKE**. En el siguiente ejemplo, se verifica que cada persona tenga una única *HomeAddress* (o ninguna) y una única *ShippingAddress* (o ninguna). Si no fuera así, la consulta no duplicaría los registros  porque devolvería previamente un error. 

<view-sql-code fileName="FilterAndCheckSnowflake"/>


Se puede utilizar la cláusula **COLUMNS** para seleccionar, renombrar, u operar sobre las columnas físicas de la tabla. El código SQL generado incluirá una subconsulta con esas columnas.
    
<view-sql-code fileName="FilterAndColumns"/>


## ANTI JOIN

El lenguaje **Crono SQL** soporta todos los *joins* habituales:

- **INNER JOIN**
- **LEFT JOIN**
- **RIGHT JOIN**
- **FULL JOIN**
- **CROSS JOIN** (también **CROSS APPLY**)

Además, implementa el **ANTI JOIN**. Un **ANTI JOIN** devuelve todos los registros de la izquierda que no aparecen en la parte derecha de la relación. Para ello, el SQL generado incluye un predicado **NOT EXISTS IN (…)**

La  siguiente consulta devuelve todos los clientes que no tienen ninguna venta.  Puede ampliar la información sobre los **ANTI JOIN** en [el blog de SQL Server de Dale Burnett](http://daleburnett.com/2011/10/semi-joins-and-anti-joins/).

<view-sql-code fileName="AntiJoin"/>    

El **ANTI JOIN** se puede combinar con el resto de características del lenguaje.  

Esta consulta devuelve todos las personas que no tienen Home Address.

<view-sql-code fileName="AntiJoinAndFilter"/>

## SEMI JOIN

El lenguaje **Crono SQL** implementa también la relación **SEMI JOIN**. Un **SEMI JOIN** devuelve todos los registros de la izquierda que aparecen en la parte derecha de la relación. Para ello, el SQL generado incluye un predicado **EXISTS IN (…)**, por lo que a diferencia del **INNER JOIN** no duplica los registros en el resultado.

Esta consulta devuelve todos los clientes que tienen alguna venta (sin duplicados). Puede ampliar la información sobre los **SEMI JOIN** en [el blog de SQL Server de Dale Burnett](http://daleburnett.com/2011/10/semi-joins-and-anti-joins/).
     

<view-sql-code fileName="SemiJoin"/>

## UNPIVOT

Se puede utilizar el operador **UNPIVOT** (según la [sintaxis de T-SQL](https://technet.microsoft.com/es-es/library/ms177410(v=sql.105).aspx)) para despivotar las columnas de una tabla.

En este ejemplo, las columna *“AddressLine1”*  y *“AddressLine2”* se han convertido en filas diferenciadas, duplicándose los registros.

<view-sql-code fileName="Unpivot"/>

## ORDER BY

Se puede utilizar la cláusula **ORDER BY** para forzar la ordenación del resultado.


<view-sql-code fileName="OrderBy1"/>
    
    
El **ORDER BY** se puede escribir haciendo referencia a la posición de las columnas. 
    

<view-sql-code fileName="OrderBy2"/>

## SELECT DISTINCT

Se puede utilizar la palabra clave **DISTINCT** para obtener los valores distintos
    
    
<view-sql-code fileName="SelectDistinct"/>


## SELECT TOP

Se puede utilizar la palabra clave **TOP** para limitar el número de registros del resultado.

Esta consulta devuelve los 5 clientes con mayores ventas. 

<view-sql-code fileName="Top"/>


## OVER ()

Las funciones de ventana **OVER (…)** también están soportadas. 

Esta consulta devuelve las ventas acumuladas desde el principio de cada año. La funciones de ventana, también llamadas funciones analíticas, tienen mucha utilidad en entornos ETL/DWH y permiten simplificar el desarrollo de muchos escenarios ETL comunes.  Puede ampliar la información sobre las funciones de ventana en la documentación de la [cláusula **OVER** en T-SQL](https://msdn.microsoft.com/es-es/library/ms189461.aspx).

<view-sql-code fileName="Over"/>


## TOP OVER ()

Se puede incluir la cláusula **OVER** junto a la palabra clave **TOP** para limitar el número de registros por grupos de registros.

Esta consulta devuelve los tres clientes con más ventas en cada territorio.


<view-sql-code fileName="TopOver1"/>

La combinación **TOP n OVER ()** tiene muchos usos en procesos ETL/DWH. La sentencia SQL generada es un consulta sobre una subconsulta de una subconsulta. La siguiente consulta devuelve la última venta de cada cliente.


<view-sql-code fileName="TopOver2"/>




## WITH

Las [sentencias CTE](https://msdn.microsoft.com/es-es/library/ms175972.aspx) con cláusula **WITH** están soportadas.

<view-sql-code fileName="With"/>


## UNION y UNION ALL

Se pueden utilizar los operadores **UNION** y **UNION ALL**

Este ejemplo tiene únicamente fines didácticos. Para combinar de este modo dos o más consultas es preferible el operador **COMBINE** que se muestra continuación.


<view-sql-code fileName="Union"/>

## COMBINE


El operador **COMBINE BY** permite combinar dos o más consultas en un único resultado.

    
<view-sql-code fileName="Combine1"/>    

Se pueden utilizar tablas distintas en cada consulta del **COMBINE**. En este ejemplo, se comparan las ventas y las compras por producto. El SQL generado combinará los resultados utilizando un **FULL JOIN**.

<view-sql-code fileName="Combine2"/>

## MATERIALIZE

La cláusula **MATERIALIZE** permite crear una tabla temporal con el contenido de una subconsulta. Es decir, antes de la ejecución de la consulta, se crean las tablas temporales necesarias y finalmente se ejecuta la consulta utilizando dichas tablas. Esta estrategia de carga simplifica el plan de ejecución del motor de base de datos y se pueden obtener mejoras de rendimiento muy significativas, sin penalizar o dificultar la escritura de la consulta.

<view-sql-code fileName="Materialize1"/>


Con la cláusula **MATERIALIZE**, también se pueden materializar las consultas de una sentencia **COMBINE**. En este ejemplo, primero se ejecutará la consulta con las ventas, luego se ejecutará una consulta con las compras, y finalmente se combinarán en un único resultado.


<view-sql-code fileName="MaterializeCombine"/>

## CAST automático

Se puede forzar el tipo de datos resultante de una columna especificándolo justo después del alias de la columna. El SQL generado incluirá una llamada a la función **CAST**.

<view-sql-code fileName="AutomaticCast"/>

## SELECTs anidados

Es posible incluir varios **SELECT** en una misma consulta. Esta sintaxis permite escribir rápidamente una consulta sobre el resultado de otra consulta.  Son consultas encadenadas.

Este consulta devuelve la media de las ventas anuales de cada producto.


<view-sql-code fileName="NestedSelects1"/>


La cláusulas **SELECT** encadenadas permiten, por ejemplo, contar el número de registros que devuelve una consulta previa. La siguiente consulta ejecuta un **count(\*)** sobre el resultado de la consulta inferior.


<view-sql-code fileName="NestedSelects2"/>

## Resumen

En resumen, si se conoce SQL, ya se conoce la parte más importante de **Crono SQL**. **Crono SQL**, simplemente, facilita la escritura de SQL y aporta algunas extensiones para necesidades comunes en ETL/DWH. Destacamos:

- Posibilidad de referenciar a Alias de columnas de la consulta
- No es necesario el **GROUP BY**
- Sintaxis simplificada de los **JOIN**
- Sentencia **COMBINE**
- Cláusula **MATERIALIZE**
- Cláusula **CHECK SNOWFLAKE**
- Cláusulas **COLUMNS** y **FILTER** para reducir el número de subconsultas
- Cláusula **TOP OVER**
- Relaciones **ANTI JOIN** y **SEMI JOIN**
- **SELECTs** anidados
 
 



















