# MiniStore — Práctica de Outer JOINs

En esta práctica se analizaron las tablas `productos` y `ventas`
utilizando LEFT JOIN, RIGHT JOIN y FULL OUTER JOIN.

## 1. ¿Por qué utilicé LEFT JOIN en la Consulta 1 y no INNER JOIN?

Utilicé LEFT JOIN porque necesitaba conservar todos los productos
del catálogo, incluso aquellos que nunca tuvieron una venta.

Si utilizara INNER JOIN, solamente aparecerían los productos que
tienen una coincidencia en la tabla ventas.

Por ejemplo, los productos 108 (Hub USB-C 7p) y 109
(Parlante Bluetooth) nunca fueron vendidos. Con INNER JOIN
estos productos desaparecerían del resultado.

Con LEFT JOIN permanecen en el resultado y sus datos de venta
aparecen como NULL.


## 2. ¿Por qué utilicé RIGHT JOIN en la Consulta 2?

Utilicé RIGHT JOIN porque necesitaba conservar todas las filas
de la tabla ventas, incluso aquellas que no tienen un producto
correspondiente en el catálogo.

En la consulta:

productos es la tabla izquierda.

ventas es la tabla derecha.

Por eso RIGHT JOIN conserva todas las ventas.

Esto permite detectar la venta 10, que tiene producto_id 999.
Ese ID no existe en la tabla productos, por lo que los datos
del producto aparecen como NULL.


## 3. ¿Qué representan los valores NULL?

Los valores NULL indican que no se encontró una coincidencia
entre las dos tablas.

En la Consulta 1, cuando venta_id aparece como NULL significa
que ese producto existe en el catálogo pero nunca fue vendido.

Por ejemplo, los productos 108 y 109 tienen venta_id NULL.

En la Consulta 2, cuando producto_id de la tabla productos
aparece como NULL significa que existe una venta registrada
pero no existe el producto correspondiente en el catálogo.

Esto ocurre con la venta 10, que tiene producto_id 999.


## 4. ¿Cuándo utilizaría FULL OUTER JOIN?

Utilizaría FULL OUTER JOIN cuando necesitara realizar una
auditoría completa entre dos tablas sin perder ningún registro.

Por ejemplo, podría utilizarse para detectar al mismo tiempo:

- Productos que existen en el catálogo pero nunca fueron vendidos.
- Ventas asociadas a productos que no existen en el catálogo.
- Productos y ventas que sí tienen una coincidencia correcta.

FULL OUTER JOIN permite conservar todos los registros de ambas
tablas y detectar posibles problemas de calidad de datos.
