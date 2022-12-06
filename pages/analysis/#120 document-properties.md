---
title: "Propiedades del documento"
sidebarDepth: 2
---




# Propiedades de documento

Haciendo clic en el botón "Propiedades" de la cinta de botones se abre la ventana de "Propiedades de documento".

![Botón propiedades](/images/analysis/BotonPropiedades.png)

La ventana de propiedades tiene tres pestañas o vistas:

## Vista "General"

Desde la cista "general" se pueden configurar estas propiedades del documento:

- **Catálogo**: Es el catálogo del que se leerán los datos. Se puede cambiar el catálogo de un informe ya construído. El nuevo catálogo debe ser *compatible*, es decir, deben estar definidos los indicadores y dimensiones que se usan en el informe. Por ejemplo, se puede cambiar el catálogo para utilizar una versión del mismo catálogo que aún está en desarrollo o en pruebas. También se puede cambiar entre una versión en local del catálogo y una versión publicada en un servidor Crono.
- **Conexión**: Es la conexión a la base de datos donde se ejecutarán las consultas. De manera predeterminada se usa la conexión definida en el catálogo, pero se puede cambiar para conectarse a otra base de datos (una base de datos de desarrollo, por ejemplo). 
- **Paleta de colores de gráfico**: Es la paleta de colores que se utilizará de manera predeterminada en los gráficos del documento. Lo habitual es utilizar la misma paleta para todos los gráficos del documento, pero se puede cambiar la paleta de un gráfico determinado desde el botón "Opciones".
- **Fuente**: Es la fuente (tipo de letra, tamaño, color, estilo...) predeterminada que se usará en las tablas del documento. 
- **Admite data input**: Activa las opciones de introducción de datos en este documento (funcionalidad experimental).
- **Es documento de solo lectura**: Oculta las opciones de edición del documento. Es la misma funcionalidad que ofrece el botón "Bloquear informe".
- **Utilizar conexión de equipo**: Si se marca esta opción, y el catálogo utiliza una "conexión de equipo", y existe una conexión de equipo con el mismo nombre en el equipo de cliente, se utilizará la conexión definida localmente para realizar las consultas (en lugar de la conexión definica en el servidor).


![Vista general](/images/analysis/PropiedadesVistaGeneral.png)


## Vista "Parámetros"

Desde esta ventana se pueden configurar los "Parámetros de informes". 

![Vista Parámetros](/images/analysis/PropiedadesVistaParametros.png)


Los parámetros son variables que se pueden utilizar en las fórmulas de las columnas y que el usuario introduce al actualizar el informe.

Existen tres tipos de parámetros:

- **Parámetro de usuario**: Permite que el usuario establezca un valor al actualizar el informe. Por ejemplo, se puede configurar para que pregunte el valor de la variable `@año` y luego esa variable se puede utilizar en las fórmulas.
- **Parámetro calculado**: En este caso el usuario no introduce el valor, si no que se calcula a partir de una expresión. Por ejemplo, se puede definir el `@año` como `year(getdate())` y esa variable contendrá siempre el año en curso.
- **Elemento de negocio parametrizable**: En este caso el usuario selecciona un indicador (o una dimensión). Por ejemplo, se puede dejar al usuario escoger el `@kpi` entre una lista de indicadores. De este modo un mismo informe se puede actualizar con los valores de un indicador u otro.

## Vista "Informes"

Deste esta ventana se pueden ver todas los informes del documento. 

![Vista Informes](/images/analysis/PropiedadesVistaInformes.png)

Desde el menú contextual se pueden renombrar, eliminar o duplicar los informes. También se pueden reordenar mediante drag & drop.


![Vista Informes](/images/analysis/MenuContextualInforme.png)
