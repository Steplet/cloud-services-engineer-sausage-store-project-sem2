
CREATE TABLE IF NOT EXISTS product (
    id           BIGSERIAL PRIMARY KEY,
    name         TEXT NOT NULL,
    picture_url  TEXT,
    price        NUMERIC(10, 2)
);

CREATE TABLE IF NOT EXISTS orders (
    id            BIGSERIAL PRIMARY KEY,
    status        TEXT,
    date_created  DATE
);

CREATE TABLE IF NOT EXISTS order_product (
    order_id    BIGINT NOT NULL,
    product_id  BIGINT NOT NULL,
    quantity    INTEGER NOT NULL,
    CONSTRAINT pk_order_product PRIMARY KEY (order_id, product_id),
    CONSTRAINT fk_order_product_order
        FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE CASCADE,
    CONSTRAINT fk_order_product_product
        FOREIGN KEY (product_id) REFERENCES product (id)
);

