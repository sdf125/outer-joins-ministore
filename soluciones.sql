-- ══════════════════════════════════════════
-- MiniStore — Soluciones con Outer JOINs
-- Autor: Florencia López
-- ══════════════════════════════════════════


-- ── CONSULTA 1: LEFT JOIN ─────────────────
-- Mostrar todos los productos y sus ventas.
-- Los productos sin ventas aparecerán con NULL.

SELECT
    p.producto_id,
    p.nombre,
    p.categoria,
    v.venta_id,
    v.cantidad,
    v.fecha_venta
FROM productos p
LEFT JOIN ventas v
    ON p.producto_id = v.producto_id;


-- Productos que nunca fueron vendidos.

SELECT
    p.producto_id,
    p.nombre,
    p.categoria,
    v.venta_id
FROM productos p
LEFT JOIN ventas v
    ON p.producto_id = v.producto_id
WHERE v.venta_id IS NULL;


-- ── CONSULTA 2: RIGHT JOIN ────────────────
-- Detectar ventas asociadas a productos
-- inexistentes en el catálogo.

SELECT
    p.producto_id AS producto_catalogo,
    p.nombre,
    v.venta_id,
    v.producto_id AS producto_en_venta,
    v.cliente_id,
    v.cantidad,
    v.fecha_venta
FROM productos p
RIGHT JOIN ventas v
    ON p.producto_id = v.producto_id
WHERE p.producto_id IS NULL;


-- ── CONSULTA 3: FULL OUTER JOIN ───────────
-- Vista completa de productos y ventas.

SELECT
    p.producto_id AS producto_catalogo,
    p.nombre,
    p.categoria,
    v.venta_id,
    v.producto_id AS producto_en_venta,
    v.cliente_id,
    v.cantidad,
    v.fecha_venta
FROM productos p
FULL OUTER JOIN ventas v
    ON p.producto_id = v.producto_id
ORDER BY p.producto_id;


-- Auditoría: mostrar solamente registros
-- donde falta una coincidencia.

SELECT
    p.producto_id AS producto_catalogo,
    p.nombre,
    v.venta_id,
    v.producto_id AS producto_en_venta
FROM productos p
FULL OUTER JOIN ventas v
    ON p.producto_id = v.producto_id
WHERE v.venta_id IS NULL
   OR p.producto_id IS NULL;