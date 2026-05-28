
ALTER TABLE product
    ALTER COLUMN name SET NOT NULL;

ALTER TABLE orders
    ALTER COLUMN status SET NOT NULL,
    ALTER COLUMN date_created SET NOT NULL;

ALTER TABLE order_product
    ALTER COLUMN quantity SET NOT NULL;

ALTER TABLE order_product
    ADD CONSTRAINT chk_order_product_quantity_positive CHECK (quantity > 0);

