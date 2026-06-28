IF OBJECT_ID ('bronze.customers') IS NULL
CREATE TABLE bronze.customers (
    customer_id                 NVARCHAR(50),
    customer_unique_id          NVARCHAR(50),
    customer_zip_code_prefix    NVARCHAR(50),    
    customer_city               NVARCHAR(50),
    customer_state              NVARCHAR(50)
);

IF OBJECT_ID ('bronze.geolocation') IS NULL
CREATE TABLE bronze.geolocation (
    geolocation_zip_code_prefix    NVARCHAR(50),
    geolocation_lat                NVARCHAR(50),
    geolocation_lng                NVARCHAR(50),    
    geolocation_city               NVARCHAR(50),
    geolocation_state              NVARCHAR(50)
);

IF OBJECT_ID ('bronze.order_items') IS NULL
CREATE TABLE bronze.order_items (
    order_id              NVARCHAR(50),
    order_item_id         NVARCHAR(50),
    product_id            NVARCHAR(50),    
    seller_id             NVARCHAR(50),
    shipping_limit_date   NVARCHAR(50),
    price                 NVARCHAR(50),
    freight_value         NVARCHAR(50)
);

IF OBJECT_ID ('bronze.order_payments') IS NULL
CREATE TABLE bronze.order_payments (
    order_id                NVARCHAR(50),
    payment_sequential      NVARCHAR(50),
    payment_type            NVARCHAR(50),    
    payment_installments    NVARCHAR(50),
    payment_value           NVARCHAR(50)
);

IF OBJECT_ID ('bronze.order_reviews') IS NULL
CREATE TABLE bronze.order_reviews (
    review_id                NVARCHAR(50),
    order_id                 NVARCHAR(50),
    review_score             NVARCHAR(5),    
    review_comment_title     NVARCHAR(255),
    review_comment_message   NVARCHAR(max),
    review_creation_date     NVARCHAR(30),
    review_answer_timestamp  NVARCHAR(30)
);

IF OBJECT_ID ('bronze.orders') IS NULL
CREATE TABLE bronze.orders (
    order_id                       NVARCHAR(50),
    customer_id                    NVARCHAR(50),
    order_status                   NVARCHAR(50),    
    order_purchase_timestamp       NVARCHAR(50),
    order_approved_at              NVARCHAR(50),
    order_delivered_carrier_date   NVARCHAR(50),
    order_delivered_customer_date  NVARCHAR(50),
    order_estimated_delivery_date  NVARCHAR(50)
);

IF OBJECT_ID ('bronze.products') IS NULL
CREATE TABLE bronze.products (
    product_id                     NVARCHAR(50),
    product_category_name          NVARCHAR(50),
    product_name_lenght            NVARCHAR(50),    
    product_descripton_lenght      NVARCHAR(50),
    product_photos_qty             NVARCHAR(50),
    product_weight_g               NVARCHAR(50),
    product_length_cm              NVARCHAR(50),
    product_height_cm              NVARCHAR(50),
    product_width_cm               NVARCHAR(50)
);

IF OBJECT_ID ('bronze.sellers') IS NULL
CREATE TABLE bronze.sellers (
    seller_id                    NVARCHAR(50),
    seller_zip_code_prefix       NVARCHAR(50),
    seller_city                  NVARCHAR(50),
    seller_state                 NVARCHAR(50)
    
);


IF OBJECT_ID ('bronze.product_category') IS NULL
CREATE TABLE bronze.product_category (
    product_category_name                       NVARCHAR(50),
    product_category_name_english               NVARCHAR(50)
    
);
