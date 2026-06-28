CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    DECLARE @batch_start_time DATETIME2, @batch_end_time DATETIME2;
    DECLARE @start_time DATETIME2, @end_time DATETIME2;

    BEGIN TRY
        SET @batch_start_time = SYSDATETIME();

        PRINT '============================================';
        PRINT 'Loading Bronze Layer';
        PRINT '============================================';

        PRINT '--------------------------------------------';
        PRINT 'Loading Tables';
        PRINT '--------------------------------------------';

        -- ---------------------------------------------------
        -- customers
        -- ---------------------------------------------------
        SET @start_time = SYSDATETIME();
        TRUNCATE TABLE bronze.customers;

        BULK INSERT bronze.customers
        FROM '/var/opt/mssql/data/olist_customers_dataset.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = SYSDATETIME();
        PRINT '>> customers loaded in ' + CAST(DATEDIFF(MILLISECOND, @start_time, @end_time) AS VARCHAR) + ' ms';

        -- ---------------------------------------------------
        -- geolocation
        -- ---------------------------------------------------
        SET @start_time = SYSDATETIME();
        TRUNCATE TABLE bronze.geolocation;

        BULK INSERT bronze.geolocation
        FROM '/var/opt/mssql/data/olist_geolocation_dataset.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = SYSDATETIME();
        PRINT '>> geolocation loaded in ' + CAST(DATEDIFF(MILLISECOND, @start_time, @end_time) AS VARCHAR) + ' ms';

        -- ---------------------------------------------------
        -- orders
        -- ---------------------------------------------------
        SET @start_time = SYSDATETIME();
        TRUNCATE TABLE bronze.orders;

        BULK INSERT bronze.orders
        FROM '/var/opt/mssql/data/olist_orders_dataset.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = SYSDATETIME();
        PRINT '>> orders loaded in ' + CAST(DATEDIFF(MILLISECOND, @start_time, @end_time) AS VARCHAR) + ' ms';

        -- ---------------------------------------------------
        -- order_items
        -- ---------------------------------------------------
        SET @start_time = SYSDATETIME();
        TRUNCATE TABLE bronze.order_items;

        BULK INSERT bronze.order_items
        FROM '/var/opt/mssql/data/olist_order_items_dataset.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = SYSDATETIME();
        PRINT '>> order_items loaded in ' + CAST(DATEDIFF(MILLISECOND, @start_time, @end_time) AS VARCHAR) + ' ms';

        -- ---------------------------------------------------
        -- order_payments
        -- ---------------------------------------------------
        SET @start_time = SYSDATETIME();
        TRUNCATE TABLE bronze.order_payments;

        BULK INSERT bronze.order_payments
        FROM '/var/opt/mssql/data/olist_order_payments_dataset.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = SYSDATETIME();
        PRINT '>> order_payments loaded in ' + CAST(DATEDIFF(MILLISECOND, @start_time, @end_time) AS VARCHAR) + ' ms';

        -- ---------------------------------------------------
        -- products
        -- ---------------------------------------------------
        SET @start_time = SYSDATETIME();
        TRUNCATE TABLE bronze.products;

        BULK INSERT bronze.products
        FROM '/var/opt/mssql/data/olist_products_dataset.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = SYSDATETIME();
        PRINT '>> products loaded in ' + CAST(DATEDIFF(MILLISECOND, @start_time, @end_time) AS VARCHAR) + ' ms';

        -- ---------------------------------------------------
        -- product_category
        -- ---------------------------------------------------
        SET @start_time = SYSDATETIME();
        TRUNCATE TABLE bronze.product_category;

        BULK INSERT bronze.product_category
        FROM '/var/opt/mssql/data/olist_product_category_name_translation_dataset.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = SYSDATETIME();
        PRINT '>> product_category loaded in ' + CAST(DATEDIFF(MILLISECOND, @start_time, @end_time) AS VARCHAR) + ' ms';

        -- ---------------------------------------------------
        -- sellers
        -- ---------------------------------------------------
        SET @start_time = SYSDATETIME();
        TRUNCATE TABLE bronze.sellers;

        BULK INSERT bronze.sellers
        FROM '/var/opt/mssql/data/olist_sellers_dataset.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = SYSDATETIME();
        PRINT '>> sellers loaded in ' + CAST(DATEDIFF(MILLISECOND, @start_time, @end_time) AS VARCHAR) + ' ms';

        SET @batch_end_time = SYSDATETIME();
        PRINT '============================================';
        PRINT 'Bronze Layer Load Complete';
        PRINT 'Total batch duration: ' + CAST(DATEDIFF(MILLISECOND, @batch_start_time, @batch_end_time) AS VARCHAR) + ' ms';
        PRINT '============================================';

    END TRY
    BEGIN CATCH
        PRINT '============================================';
        PRINT 'ERROR OCCURRED DURING BRONZE LOAD';
        PRINT 'Error Message: ' + ERROR_MESSAGE();
        PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS VARCHAR);
        PRINT 'Error Line: ' + CAST(ERROR_LINE() AS VARCHAR);
        PRINT '============================================';
    END CATCH
END
GO
