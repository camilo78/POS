

CREATE TABLE `accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `account_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_balance` double DEFAULT NULL,
  `total_balance` double NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO accounts VALUES("1","111111","Principal","","0","","1","1","2021-07-29 05:56:07","2021-07-29 05:56:15");



CREATE TABLE `adjustments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int NOT NULL,
  `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` double NOT NULL,
  `item` int NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `attendances` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `employee_id` int NOT NULL,
  `user_id` int NOT NULL,
  `checkin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `billers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO billers VALUES("1","Camilo Alvarado","Seor.jpg","Emprende en la Web","","camilo.alvarado0501@gmail.com","96645637","Barrio La Isla, Avenidad Manuel Bonilla, casa numero 36.","La Ceiba","Atlantida","31101","Honduras","1","2021-07-29 05:16:34","2021-07-29 05:21:58");
INSERT INTO billers VALUES("10","Jonh Smith","Farmacia.png","Farmacia","","smith.78@hotmail.com","96655652","barrio La isla","La Ceiba","","","","1","2021-12-01 13:33:56","2021-12-01 13:33:56");



CREATE TABLE `brands` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `cash_registers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cash_in_hand` double NOT NULL,
  `user_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `period_id` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO cash_registers VALUES("1","50000","46","1","1","0","2021-12-01 13:39:42","2021-12-04 09:28:28");
INSERT INTO cash_registers VALUES("2","50000","1","1","1","1","2021-12-04 09:29:10","2021-12-04 09:29:10");



CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO categories VALUES("1","Medicamentos","20211204115054.png","","1","2021-07-29 10:17:22","2021-12-04 11:50:54");



CREATE TABLE `coupons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `minimum_amount` double DEFAULT NULL,
  `quantity` int NOT NULL,
  `used` int NOT NULL,
  `expired_date` date NOT NULL,
  `user_id` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO currencies VALUES("1","US Dollar","USD","1","2020-10-31 18:22:58","2020-10-31 18:34:55");
INSERT INTO currencies VALUES("2","Euro","Euro","0.85","2020-10-31 19:29:12","2020-11-10 17:15:34");
INSERT INTO currencies VALUES("3","Lempira","Lps.","23.74","2021-07-29 05:41:04","2021-07-29 05:41:04");



CREATE TABLE `customer_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO customer_groups VALUES("1","General","0","1","2018-05-12 02:09:36","2021-07-29 05:44:49");
INSERT INTO customer_groups VALUES("2","Distribuidor","-10","1","2018-05-12 02:12:14","2021-07-29 05:45:12");
INSERT INTO customer_groups VALUES("3","Revendedor","5","1","2018-05-12 02:12:26","2021-07-29 05:45:34");



CREATE TABLE `customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_group_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `points` double DEFAULT NULL,
  `deposit` double DEFAULT NULL,
  `expense` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO customers VALUES("1","1","","Cliente sin datos","","","sin numero","sin numero","4ta. Calle, 4ta Ave. Sur Barrio Las Mercedes.","El Progreso","Yoro","","Honduras","4","","0","1","2018-09-01 19:30:54","2021-07-29 05:14:26");



CREATE TABLE `deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivered_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recieved_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `departments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `deposits` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `customer_id` int NOT NULL,
  `user_id` int NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employees` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `expense_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `expenses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expense_category_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `account_id` int NOT NULL,
  `user_id` int NOT NULL,
  `cash_register_id` int DEFAULT NULL,
  `amount` double NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `general_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rtn` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_access` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_format` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `developed_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_format` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` int DEFAULT NULL,
  `theme` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_position` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO general_settings VALUES("1","Inversiones Diversas","","20210730041615.jpeg","3","own","d/m/Y","Emprende en la Web","standard","1","default.css","2018-07-06 00:13:11","2021-07-30 10:16:15","prefix");



CREATE TABLE `gift_card_recharges` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `gift_card_id` int NOT NULL,
  `amount` double NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `gift_cards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `card_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `expense` double NOT NULL,
  `customer_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `created_by` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `holidays` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `hrm_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `checkin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO hrm_settings VALUES("1","8:00am","4:00pm","2019-01-01 20:20:08","2021-07-29 05:07:07");



CREATE TABLE `languages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO languages VALUES("1","es","2018-07-07 16:59:17","2019-12-24 11:34:20");



CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES("1","2014_10_12_000000_create_users_table","1");
INSERT INTO migrations VALUES("2","2014_10_12_100000_create_password_resets_table","1");
INSERT INTO migrations VALUES("3","2018_02_17_060412_create_categories_table","1");
INSERT INTO migrations VALUES("4","2018_02_20_035727_create_brands_table","1");
INSERT INTO migrations VALUES("5","2018_02_25_100635_create_suppliers_table","1");
INSERT INTO migrations VALUES("6","2018_02_27_101619_create_warehouse_table","1");
INSERT INTO migrations VALUES("7","2018_03_03_040448_create_units_table","1");
INSERT INTO migrations VALUES("8","2018_03_04_041317_create_taxes_table","1");
INSERT INTO migrations VALUES("9","2018_03_10_061915_create_customer_groups_table","1");
INSERT INTO migrations VALUES("10","2018_03_10_090534_create_customers_table","1");
INSERT INTO migrations VALUES("11","2018_03_11_095547_create_billers_table","1");
INSERT INTO migrations VALUES("12","2018_04_05_054401_create_products_table","1");
INSERT INTO migrations VALUES("13","2018_04_06_133606_create_purchases_table","1");
INSERT INTO migrations VALUES("14","2018_04_06_154600_create_product_purchases_table","1");
INSERT INTO migrations VALUES("15","2018_04_06_154915_create_product_warhouse_table","1");
INSERT INTO migrations VALUES("16","2018_04_10_085927_create_sales_table","1");
INSERT INTO migrations VALUES("17","2018_04_10_090133_create_product_sales_table","1");
INSERT INTO migrations VALUES("18","2018_04_10_090254_create_payments_table","1");
INSERT INTO migrations VALUES("19","2018_04_10_090341_create_payment_with_cheque_table","1");
INSERT INTO migrations VALUES("20","2018_04_10_090509_create_payment_with_credit_card_table","1");
INSERT INTO migrations VALUES("21","2018_04_13_121436_create_quotation_table","1");
INSERT INTO migrations VALUES("22","2018_04_13_122324_create_product_quotation_table","1");
INSERT INTO migrations VALUES("23","2018_04_14_121802_create_transfers_table","1");
INSERT INTO migrations VALUES("24","2018_04_14_121913_create_product_transfer_table","1");
INSERT INTO migrations VALUES("25","2018_05_13_082847_add_payment_id_and_change_sale_id_to_payments_table","2");
INSERT INTO migrations VALUES("26","2018_05_13_090906_change_customer_id_to_payment_with_credit_card_table","3");
INSERT INTO migrations VALUES("27","2018_05_20_054532_create_adjustments_table","4");
INSERT INTO migrations VALUES("28","2018_05_20_054859_create_product_adjustments_table","4");
INSERT INTO migrations VALUES("29","2018_05_21_163419_create_returns_table","5");
INSERT INTO migrations VALUES("30","2018_05_21_163443_create_product_returns_table","5");
INSERT INTO migrations VALUES("31","2018_06_02_050905_create_roles_table","6");
INSERT INTO migrations VALUES("32","2018_06_02_073430_add_columns_to_users_table","7");
INSERT INTO migrations VALUES("33","2018_06_03_053738_create_permission_tables","8");
INSERT INTO migrations VALUES("36","2018_06_21_063736_create_pos_setting_table","9");
INSERT INTO migrations VALUES("37","2018_06_21_094155_add_user_id_to_sales_table","10");
INSERT INTO migrations VALUES("38","2018_06_21_101529_add_user_id_to_purchases_table","11");
INSERT INTO migrations VALUES("39","2018_06_21_103512_add_user_id_to_transfers_table","12");
INSERT INTO migrations VALUES("40","2018_06_23_061058_add_user_id_to_quotations_table","13");
INSERT INTO migrations VALUES("41","2018_06_23_082427_add_is_deleted_to_users_table","14");
INSERT INTO migrations VALUES("42","2018_06_25_043308_change_email_to_users_table","15");
INSERT INTO migrations VALUES("43","2018_07_06_115449_create_general_settings_table","16");
INSERT INTO migrations VALUES("44","2018_07_08_043944_create_languages_table","17");
INSERT INTO migrations VALUES("45","2018_07_11_102144_add_user_id_to_returns_table","18");
INSERT INTO migrations VALUES("46","2018_07_11_102334_add_user_id_to_payments_table","18");
INSERT INTO migrations VALUES("47","2018_07_22_130541_add_digital_to_products_table","19");
INSERT INTO migrations VALUES("49","2018_07_24_154250_create_deliveries_table","20");
INSERT INTO migrations VALUES("50","2018_08_16_053336_create_expense_categories_table","21");
INSERT INTO migrations VALUES("51","2018_08_17_115415_create_expenses_table","22");
INSERT INTO migrations VALUES("55","2018_08_18_050418_create_gift_cards_table","23");
INSERT INTO migrations VALUES("56","2018_08_19_063119_create_payment_with_gift_card_table","24");
INSERT INTO migrations VALUES("57","2018_08_25_042333_create_gift_card_recharges_table","25");
INSERT INTO migrations VALUES("58","2018_08_25_101354_add_deposit_expense_to_customers_table","26");
INSERT INTO migrations VALUES("59","2018_08_26_043801_create_deposits_table","27");
INSERT INTO migrations VALUES("60","2018_09_02_044042_add_keybord_active_to_pos_setting_table","28");
INSERT INTO migrations VALUES("61","2018_09_09_092713_create_payment_with_paypal_table","29");
INSERT INTO migrations VALUES("62","2018_09_10_051254_add_currency_to_general_settings_table","30");
INSERT INTO migrations VALUES("63","2018_10_22_084118_add_biller_and_store_id_to_users_table","31");
INSERT INTO migrations VALUES("65","2018_10_26_034927_create_coupons_table","32");
INSERT INTO migrations VALUES("66","2018_10_27_090857_add_coupon_to_sales_table","33");
INSERT INTO migrations VALUES("67","2018_11_07_070155_add_currency_position_to_general_settings_table","34");
INSERT INTO migrations VALUES("68","2018_11_19_094650_add_combo_to_products_table","35");
INSERT INTO migrations VALUES("69","2018_12_09_043712_create_accounts_table","36");
INSERT INTO migrations VALUES("70","2018_12_17_112253_add_is_default_to_accounts_table","37");
INSERT INTO migrations VALUES("71","2018_12_19_103941_add_account_id_to_payments_table","38");
INSERT INTO migrations VALUES("72","2018_12_20_065900_add_account_id_to_expenses_table","39");
INSERT INTO migrations VALUES("73","2018_12_20_082753_add_account_id_to_returns_table","40");
INSERT INTO migrations VALUES("74","2018_12_26_064330_create_return_purchases_table","41");
INSERT INTO migrations VALUES("75","2018_12_26_144210_create_purchase_product_return_table","42");
INSERT INTO migrations VALUES("76","2018_12_26_144708_create_purchase_product_return_table","43");
INSERT INTO migrations VALUES("77","2018_12_27_110018_create_departments_table","44");
INSERT INTO migrations VALUES("78","2018_12_30_054844_create_employees_table","45");
INSERT INTO migrations VALUES("79","2018_12_31_125210_create_payrolls_table","46");
INSERT INTO migrations VALUES("80","2018_12_31_150446_add_department_id_to_employees_table","47");
INSERT INTO migrations VALUES("81","2019_01_01_062708_add_user_id_to_expenses_table","48");
INSERT INTO migrations VALUES("82","2019_01_02_075644_create_hrm_settings_table","49");
INSERT INTO migrations VALUES("83","2019_01_02_090334_create_attendances_table","50");
INSERT INTO migrations VALUES("84","2019_01_27_160956_add_three_columns_to_general_settings_table","51");
INSERT INTO migrations VALUES("85","2019_02_15_183303_create_stock_counts_table","52");
INSERT INTO migrations VALUES("86","2019_02_17_101604_add_is_adjusted_to_stock_counts_table","53");
INSERT INTO migrations VALUES("87","2019_04_13_101707_add_tax_no_to_customers_table","54");
INSERT INTO migrations VALUES("89","2019_10_14_111455_create_holidays_table","55");
INSERT INTO migrations VALUES("90","2019_11_13_145619_add_is_variant_to_products_table","56");
INSERT INTO migrations VALUES("91","2019_11_13_150206_create_product_variants_table","57");
INSERT INTO migrations VALUES("92","2019_11_13_153828_create_variants_table","57");
INSERT INTO migrations VALUES("93","2019_11_25_134041_add_qty_to_product_variants_table","58");
INSERT INTO migrations VALUES("94","2019_11_25_134922_add_variant_id_to_product_purchases_table","58");
INSERT INTO migrations VALUES("95","2019_11_25_145341_add_variant_id_to_product_warehouse_table","58");
INSERT INTO migrations VALUES("96","2019_11_29_182201_add_variant_id_to_product_sales_table","59");
INSERT INTO migrations VALUES("97","2019_12_04_121311_add_variant_id_to_product_quotation_table","60");
INSERT INTO migrations VALUES("98","2019_12_05_123802_add_variant_id_to_product_transfer_table","61");
INSERT INTO migrations VALUES("100","2019_12_08_114954_add_variant_id_to_product_returns_table","62");
INSERT INTO migrations VALUES("101","2019_12_08_203146_add_variant_id_to_purchase_product_return_table","63");
INSERT INTO migrations VALUES("102","2020_02_28_103340_create_money_transfers_table","64");
INSERT INTO migrations VALUES("103","2020_07_01_193151_add_image_to_categories_table","65");
INSERT INTO migrations VALUES("105","2020_09_26_130426_add_user_id_to_deliveries_table","66");
INSERT INTO migrations VALUES("107","2020_10_11_125457_create_cash_registers_table","67");
INSERT INTO migrations VALUES("108","2020_10_13_155019_add_cash_register_id_to_sales_table","68");
INSERT INTO migrations VALUES("109","2020_10_13_172624_add_cash_register_id_to_returns_table","69");
INSERT INTO migrations VALUES("110","2020_10_17_212338_add_cash_register_id_to_payments_table","70");
INSERT INTO migrations VALUES("111","2020_10_18_124200_add_cash_register_id_to_expenses_table","71");
INSERT INTO migrations VALUES("112","2020_10_21_121632_add_developed_by_to_general_settings_table","72");
INSERT INTO migrations VALUES("113","2019_08_19_000000_create_failed_jobs_table","73");
INSERT INTO migrations VALUES("114","2020_10_30_135557_create_notifications_table","73");
INSERT INTO migrations VALUES("115","2020_11_01_044954_create_currencies_table","74");
INSERT INTO migrations VALUES("116","2020_11_01_140736_add_price_to_product_warehouse_table","75");
INSERT INTO migrations VALUES("117","2020_11_02_050633_add_is_diff_price_to_products_table","76");
INSERT INTO migrations VALUES("118","2020_11_09_055222_add_user_id_to_customers_table","77");
INSERT INTO migrations VALUES("119","2020_11_17_054806_add_invoice_format_to_general_settings_table","78");
INSERT INTO migrations VALUES("120","2021_02_10_074859_add_variant_id_to_product_adjustments_table","79");
INSERT INTO migrations VALUES("121","2021_03_07_093606_create_product_batches_table","80");
INSERT INTO migrations VALUES("122","2021_03_07_093759_add_product_batch_id_to_product_warehouse_table","80");
INSERT INTO migrations VALUES("123","2021_03_07_093900_add_product_batch_id_to_product_purchases_table","80");
INSERT INTO migrations VALUES("124","2021_03_11_132603_add_product_batch_id_to_product_sales_table","81");
INSERT INTO migrations VALUES("127","2021_03_25_125421_add_is_batch_to_products_table","82");
INSERT INTO migrations VALUES("128","2021_05_19_120127_add_product_batch_id_to_product_returns_table","82");
INSERT INTO migrations VALUES("130","2021_05_22_105611_add_product_batch_id_to_purchase_product_return_table","83");
INSERT INTO migrations VALUES("131","2021_05_23_124848_add_product_batch_id_to_product_transfer_table","84");
INSERT INTO migrations VALUES("132","2021_05_26_153106_add_product_batch_id_to_product_quotation_table","85");
INSERT INTO migrations VALUES("133","2021_06_08_213007_create_reward_point_settings_table","86");
INSERT INTO migrations VALUES("134","2021_06_16_104155_add_points_to_customers_table","87");
INSERT INTO migrations VALUES("135","2021_06_17_101057_add_used_points_to_payments_table","88");
INSERT INTO migrations VALUES("136","2021_07_06_132716_add_variant_list_to_products_table","89");
INSERT INTO migrations VALUES("137","2021_10_27_165423_add_rtn_to_general_settings","89");
INSERT INTO migrations VALUES("138","2021_10_28_103001_create_periods_table","89");
INSERT INTO migrations VALUES("139","2021_10_30_114153_add_period_to_cash_registers","89");
INSERT INTO migrations VALUES("140","2021_11_05_142739_add_period_to_sales_table","89");



CREATE TABLE `money_transfers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_account_id` int NOT NULL,
  `to_account_id` int NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO password_resets VALUES("camilo.alvarado0501@gmail.com","$2y$10$BE5sUVh2bhqmdx6/HpDY..VYU7UBgw0Idd/R65ELmsYOay/oCMvqS","2021-07-29 05:36:52");



CREATE TABLE `payment_with_cheque` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int NOT NULL,
  `cheque_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payment_with_credit_card` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `customer_stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payment_with_gift_card` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int NOT NULL,
  `gift_card_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payment_with_paypal` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int NOT NULL,
  `transaction_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `payment_reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `purchase_id` int DEFAULT NULL,
  `sale_id` int DEFAULT NULL,
  `cash_register_id` int DEFAULT NULL,
  `account_id` int NOT NULL,
  `amount` double NOT NULL,
  `used_points` double DEFAULT NULL,
  `change` double NOT NULL,
  `paying_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payments VALUES("1","ppr-20210729-090628","1","1","","","1","1340201.73","","0","Cash","","2021-07-29 15:06:28","2021-07-29 15:06:28");
INSERT INTO payments VALUES("2","ppr-20210804-114141","1","3","","","1","20000","","0","Cash","","2021-08-04 05:41:41","2021-08-04 05:41:41");
INSERT INTO payments VALUES("3","ppr-20210804-114155","1","2","","","1","13500","","0","Cash","","2021-08-04 05:41:55","2021-08-04 05:41:55");
INSERT INTO payments VALUES("4","ppr-20210804-031646","1","4","","","1","9680","","0","Cash","","2021-08-04 09:16:46","2021-08-04 09:16:46");
INSERT INTO payments VALUES("5","ppr-20210804-033412","1","5","","","1","158170","","0","Cash","","2021-08-04 09:34:12","2021-08-04 09:34:12");
INSERT INTO payments VALUES("6","spr-20211201-014006","46","","1","1","1","48667","","0","Cash","","2021-12-01 13:40:06","2021-12-01 13:40:06");
INSERT INTO payments VALUES("7","spr-20211201-052528","46","","2","1","1","21840.8","","0","Cash","","2021-12-01 17:25:28","2021-12-01 17:25:28");
INSERT INTO payments VALUES("8","spr-20211201-062846","46","","3","1","1","28488","","0","Cash","Documento Exonerado 56325325","2021-12-01 18:28:46","2021-12-01 18:28:46");
INSERT INTO payments VALUES("9","spr-20211201-063200","46","","4","1","1","14244","","0","Cash","","2021-12-01 18:32:00","2021-12-01 18:32:00");
INSERT INTO payments VALUES("10","spr-20211201-063305","46","","5","1","1","14244","","0","Cash","sfda","2021-12-01 18:33:05","2021-12-01 18:33:05");
INSERT INTO payments VALUES("11","spr-20211201-063350","46","","6","1","1","14244","","0","Cash","erqwreewqqwerrqwerwqerqwe","2021-12-01 18:33:50","2021-12-01 18:33:50");
INSERT INTO payments VALUES("12","spr-20211201-063458","46","","7","1","1","14244","","0","Cash","111111111111111111111","2021-12-01 18:34:58","2021-12-01 18:34:58");
INSERT INTO payments VALUES("13","spr-20211204-114736","1","","8","2","1","62436.2","","7563.8","Cash","","2021-12-04 11:47:36","2021-12-04 11:47:36");



CREATE TABLE `payrolls` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int NOT NULL,
  `account_id` int NOT NULL,
  `user_id` int NOT NULL,
  `amount` double NOT NULL,
  `paying_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `periods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cai` varchar(37) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rank_start` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rank_end` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deadline` date NOT NULL,
  `emission_point` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_type` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO periods VALUES("1","Primer periodo","652325-562563-365232-785412-325632-65","00000001","00001000","2021-12-19","001","001","01","1","2021-12-01 13:39:14","2021-12-01 13:39:14");



CREATE TABLE `permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO permissions VALUES("4","products-edit","web","2018-06-02 19:00:09","2018-06-02 19:00:09");
INSERT INTO permissions VALUES("5","products-delete","web","2018-06-03 16:54:22","2018-06-03 16:54:22");
INSERT INTO permissions VALUES("6","products-add","web","2018-06-03 18:34:14","2018-06-03 18:34:14");
INSERT INTO permissions VALUES("7","products-index","web","2018-06-03 21:34:27","2018-06-03 21:34:27");
INSERT INTO permissions VALUES("8","purchases-index","web","2018-06-04 02:03:19","2018-06-04 02:03:19");
INSERT INTO permissions VALUES("9","purchases-add","web","2018-06-04 02:12:25","2018-06-04 02:12:25");
INSERT INTO permissions VALUES("10","purchases-edit","web","2018-06-04 03:47:36","2018-06-04 03:47:36");
INSERT INTO permissions VALUES("11","purchases-delete","web","2018-06-04 03:47:36","2018-06-04 03:47:36");
INSERT INTO permissions VALUES("12","sales-index","web","2018-06-04 04:49:08","2018-06-04 04:49:08");
INSERT INTO permissions VALUES("13","sales-add","web","2018-06-04 04:49:52","2018-06-04 04:49:52");
INSERT INTO permissions VALUES("14","sales-edit","web","2018-06-04 04:49:52","2018-06-04 04:49:52");
INSERT INTO permissions VALUES("15","sales-delete","web","2018-06-04 04:49:53","2018-06-04 04:49:53");
INSERT INTO permissions VALUES("16","quotes-index","web","2018-06-04 16:05:10","2018-06-04 16:05:10");
INSERT INTO permissions VALUES("17","quotes-add","web","2018-06-04 16:05:10","2018-06-04 16:05:10");
INSERT INTO permissions VALUES("18","quotes-edit","web","2018-06-04 16:05:10","2018-06-04 16:05:10");
INSERT INTO permissions VALUES("19","quotes-delete","web","2018-06-04 16:05:10","2018-06-04 16:05:10");
INSERT INTO permissions VALUES("20","transfers-index","web","2018-06-04 16:30:03","2018-06-04 16:30:03");
INSERT INTO permissions VALUES("21","transfers-add","web","2018-06-04 16:30:03","2018-06-04 16:30:03");
INSERT INTO permissions VALUES("22","transfers-edit","web","2018-06-04 16:30:03","2018-06-04 16:30:03");
INSERT INTO permissions VALUES("23","transfers-delete","web","2018-06-04 16:30:03","2018-06-04 16:30:03");
INSERT INTO permissions VALUES("24","returns-index","web","2018-06-04 16:50:24","2018-06-04 16:50:24");
INSERT INTO permissions VALUES("25","returns-add","web","2018-06-04 16:50:24","2018-06-04 16:50:24");
INSERT INTO permissions VALUES("26","returns-edit","web","2018-06-04 16:50:25","2018-06-04 16:50:25");
INSERT INTO permissions VALUES("27","returns-delete","web","2018-06-04 16:50:25","2018-06-04 16:50:25");
INSERT INTO permissions VALUES("28","customers-index","web","2018-06-04 17:15:54","2018-06-04 17:15:54");
INSERT INTO permissions VALUES("29","customers-add","web","2018-06-04 17:15:55","2018-06-04 17:15:55");
INSERT INTO permissions VALUES("30","customers-edit","web","2018-06-04 17:15:55","2018-06-04 17:15:55");
INSERT INTO permissions VALUES("31","customers-delete","web","2018-06-04 17:15:55","2018-06-04 17:15:55");
INSERT INTO permissions VALUES("32","suppliers-index","web","2018-06-04 17:40:12","2018-06-04 17:40:12");
INSERT INTO permissions VALUES("33","suppliers-add","web","2018-06-04 17:40:12","2018-06-04 17:40:12");
INSERT INTO permissions VALUES("34","suppliers-edit","web","2018-06-04 17:40:12","2018-06-04 17:40:12");
INSERT INTO permissions VALUES("35","suppliers-delete","web","2018-06-04 17:40:12","2018-06-04 17:40:12");
INSERT INTO permissions VALUES("36","product-report","web","2018-06-24 17:05:33","2018-06-24 17:05:33");
INSERT INTO permissions VALUES("37","purchase-report","web","2018-06-24 17:24:56","2018-06-24 17:24:56");
INSERT INTO permissions VALUES("38","sale-report","web","2018-06-24 17:33:13","2018-06-24 17:33:13");
INSERT INTO permissions VALUES("39","customer-report","web","2018-06-24 17:36:51","2018-06-24 17:36:51");
INSERT INTO permissions VALUES("40","due-report","web","2018-06-24 17:39:52","2018-06-24 17:39:52");
INSERT INTO permissions VALUES("41","users-index","web","2018-06-24 18:00:10","2018-06-24 18:00:10");
INSERT INTO permissions VALUES("42","users-add","web","2018-06-24 18:00:10","2018-06-24 18:00:10");
INSERT INTO permissions VALUES("43","users-edit","web","2018-06-24 18:01:30","2018-06-24 18:01:30");
INSERT INTO permissions VALUES("44","users-delete","web","2018-06-24 18:01:30","2018-06-24 18:01:30");
INSERT INTO permissions VALUES("45","profit-loss","web","2018-07-14 15:50:05","2018-07-14 15:50:05");
INSERT INTO permissions VALUES("46","best-seller","web","2018-07-14 16:01:38","2018-07-14 16:01:38");
INSERT INTO permissions VALUES("47","daily-sale","web","2018-07-14 16:24:21","2018-07-14 16:24:21");
INSERT INTO permissions VALUES("48","monthly-sale","web","2018-07-14 16:30:41","2018-07-14 16:30:41");
INSERT INTO permissions VALUES("49","daily-purchase","web","2018-07-14 16:36:46","2018-07-14 16:36:46");
INSERT INTO permissions VALUES("50","monthly-purchase","web","2018-07-14 16:48:17","2018-07-14 16:48:17");
INSERT INTO permissions VALUES("51","payment-report","web","2018-07-14 17:10:41","2018-07-14 17:10:41");
INSERT INTO permissions VALUES("52","warehouse-stock-report","web","2018-07-14 17:16:55","2018-07-14 17:16:55");
INSERT INTO permissions VALUES("53","product-qty-alert","web","2018-07-14 17:33:21","2018-07-14 17:33:21");
INSERT INTO permissions VALUES("54","supplier-report","web","2018-07-29 21:00:01","2018-07-29 21:00:01");
INSERT INTO permissions VALUES("55","expenses-index","web","2018-09-04 19:07:10","2018-09-04 19:07:10");
INSERT INTO permissions VALUES("56","expenses-add","web","2018-09-04 19:07:10","2018-09-04 19:07:10");
INSERT INTO permissions VALUES("57","expenses-edit","web","2018-09-04 19:07:10","2018-09-04 19:07:10");
INSERT INTO permissions VALUES("58","expenses-delete","web","2018-09-04 19:07:11","2018-09-04 19:07:11");
INSERT INTO permissions VALUES("59","general_setting","web","2018-10-19 17:10:04","2018-10-19 17:10:04");
INSERT INTO permissions VALUES("60","mail_setting","web","2018-10-19 17:10:04","2018-10-19 17:10:04");
INSERT INTO permissions VALUES("61","pos_setting","web","2018-10-19 17:10:04","2018-10-19 17:10:04");
INSERT INTO permissions VALUES("62","hrm_setting","web","2019-01-02 04:30:23","2019-01-02 04:30:23");
INSERT INTO permissions VALUES("63","purchase-return-index","web","2019-01-02 15:45:14","2019-01-02 15:45:14");
INSERT INTO permissions VALUES("64","purchase-return-add","web","2019-01-02 15:45:14","2019-01-02 15:45:14");
INSERT INTO permissions VALUES("65","purchase-return-edit","web","2019-01-02 15:45:14","2019-01-02 15:45:14");
INSERT INTO permissions VALUES("66","purchase-return-delete","web","2019-01-02 15:45:14","2019-01-02 15:45:14");
INSERT INTO permissions VALUES("67","account-index","web","2019-01-02 16:06:13","2019-01-02 16:06:13");
INSERT INTO permissions VALUES("68","balance-sheet","web","2019-01-02 16:06:14","2019-01-02 16:06:14");
INSERT INTO permissions VALUES("69","account-statement","web","2019-01-02 16:06:14","2019-01-02 16:06:14");
INSERT INTO permissions VALUES("70","department","web","2019-01-02 16:30:01","2019-01-02 16:30:01");
INSERT INTO permissions VALUES("71","attendance","web","2019-01-02 16:30:01","2019-01-02 16:30:01");
INSERT INTO permissions VALUES("72","payroll","web","2019-01-02 16:30:01","2019-01-02 16:30:01");
INSERT INTO permissions VALUES("73","employees-index","web","2019-01-02 16:52:19","2019-01-02 16:52:19");
INSERT INTO permissions VALUES("74","employees-add","web","2019-01-02 16:52:19","2019-01-02 16:52:19");
INSERT INTO permissions VALUES("75","employees-edit","web","2019-01-02 16:52:19","2019-01-02 16:52:19");
INSERT INTO permissions VALUES("76","employees-delete","web","2019-01-02 16:52:19","2019-01-02 16:52:19");
INSERT INTO permissions VALUES("77","user-report","web","2019-01-16 00:48:18","2019-01-16 00:48:18");
INSERT INTO permissions VALUES("78","stock_count","web","2019-02-17 04:32:01","2019-02-17 04:32:01");
INSERT INTO permissions VALUES("79","adjustment","web","2019-02-17 04:32:02","2019-02-17 04:32:02");
INSERT INTO permissions VALUES("80","sms_setting","web","2019-02-21 23:18:03","2019-02-21 23:18:03");
INSERT INTO permissions VALUES("81","create_sms","web","2019-02-21 23:18:03","2019-02-21 23:18:03");
INSERT INTO permissions VALUES("82","print_barcode","web","2019-03-06 23:02:19","2019-03-06 23:02:19");
INSERT INTO permissions VALUES("83","empty_database","web","2019-03-06 23:02:19","2019-03-06 23:02:19");
INSERT INTO permissions VALUES("84","customer_group","web","2019-03-06 23:37:15","2019-03-06 23:37:15");
INSERT INTO permissions VALUES("85","unit","web","2019-03-06 23:37:15","2019-03-06 23:37:15");
INSERT INTO permissions VALUES("86","tax","web","2019-03-06 23:37:15","2019-03-06 23:37:15");
INSERT INTO permissions VALUES("87","gift_card","web","2019-03-07 00:29:38","2019-03-07 00:29:38");
INSERT INTO permissions VALUES("88","coupon","web","2019-03-07 00:29:38","2019-03-07 00:29:38");
INSERT INTO permissions VALUES("89","holiday","web","2019-10-19 02:57:15","2019-10-19 02:57:15");
INSERT INTO permissions VALUES("90","warehouse-report","web","2019-10-22 00:00:23","2019-10-22 00:00:23");
INSERT INTO permissions VALUES("91","warehouse","web","2020-02-26 00:47:32","2020-02-26 00:47:32");
INSERT INTO permissions VALUES("92","brand","web","2020-02-26 00:59:59","2020-02-26 00:59:59");
INSERT INTO permissions VALUES("93","billers-index","web","2020-02-26 01:11:15","2020-02-26 01:11:15");
INSERT INTO permissions VALUES("94","billers-add","web","2020-02-26 01:11:15","2020-02-26 01:11:15");
INSERT INTO permissions VALUES("95","billers-edit","web","2020-02-26 01:11:15","2020-02-26 01:11:15");
INSERT INTO permissions VALUES("96","billers-delete","web","2020-02-26 01:11:15","2020-02-26 01:11:15");
INSERT INTO permissions VALUES("97","money-transfer","web","2020-03-01 23:41:48","2020-03-01 23:41:48");
INSERT INTO permissions VALUES("98","category","web","2020-07-13 06:13:16","2020-07-13 06:13:16");
INSERT INTO permissions VALUES("99","delivery","web","2020-07-13 06:13:16","2020-07-13 06:13:16");
INSERT INTO permissions VALUES("100","send_notification","web","2020-10-31 00:21:31","2020-10-31 00:21:31");
INSERT INTO permissions VALUES("101","today_sale","web","2020-10-31 00:57:04","2020-10-31 00:57:04");
INSERT INTO permissions VALUES("102","today_profit","web","2020-10-31 00:57:04","2020-10-31 00:57:04");
INSERT INTO permissions VALUES("103","currency","web","2020-11-08 18:23:11","2020-11-08 18:23:11");
INSERT INTO permissions VALUES("104","backup_database","web","2020-11-14 18:16:55","2020-11-14 18:16:55");
INSERT INTO permissions VALUES("105","reward_point_setting","web","2021-06-26 22:34:42","2021-06-26 22:34:42");



CREATE TABLE `pos_setting` (
  `id` int NOT NULL,
  `customer_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `biller_id` int NOT NULL,
  `product_number` int NOT NULL,
  `keybord_active` tinyint(1) NOT NULL,
  `stripe_public_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_secret_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `pos_setting_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO pos_setting VALUES("1","1","1","1","4","0","pk_test_ITN7KOYiIsHSCQ0UMRcgaYUB","sk_test_TtQQaawhEYRwa3mU9CzttrEy","2018-09-01 21:17:04","2021-07-30 08:51:41");



CREATE TABLE `product_adjustments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `adjustment_id` int NOT NULL,
  `product_id` int NOT NULL,
  `variant_id` int DEFAULT NULL,
  `qty` double NOT NULL,
  `action` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_batches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `batch_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_date` date NOT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_purchases` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_batch_id` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `qty` double NOT NULL,
  `recieved` double NOT NULL,
  `purchase_unit_id` int NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=392 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_purchases VALUES("317","1","1","","","82","82","1","320","0","0","0","26240","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("318","1","2","","","37","37","1","190","0","0","0","7030","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("319","1","3","","","0","0","1","30","0","0","0","0","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("320","1","4","","","44","44","1","44","0","0","0","1936","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("321","1","5","","","26","26","1","85","0","0","0","2210","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("322","1","6","","","27","27","1","180","0","0","0","4860","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("323","1","7","","","62","62","1","400","0","0","0","24800","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("324","1","8","","","240","240","12","32","0","0","0","7680","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("325","1","9","","","87","87","12","57","0","0","0","4959","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("326","1","10","","","0","0","13","0","0","0","0","0","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("327","1","11","","","197","197","13","43","0","0","0","8471","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("328","1","12","","","0","0","1","0","0","0","0","0","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("329","1","13","","","23","23","1","232.04","0","0","0","5336.92","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("330","1","14","","","40","40","1","231.95","0","0","0","9278","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("331","1","15","","","1975","1975","1","88.85","0","0","0","175478.75","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("332","1","16","","","29","29","13","48.69","0","0","0","1412.01","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("333","1","17","","","750","750","12","74.5","0","0","0","55875","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("334","1","18","","","75","75","1","85","0","0","0","6375","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("335","1","19","","","90","90","1","200","0","0","0","18000","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("336","1","20","","","114","114","1","140","0","0","0","15960","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("337","1","21","","","90","90","1","240","0","0","0","21600","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("338","1","22","","","28","28","1","35","0","0","0","980","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("339","1","23","","","9","9","1","950","0","0","0","8550","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("340","1","24","","","33","33","13","43","0","0","0","1419","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("341","1","25","","","120","120","1","435","0","0","0","52200","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("342","1","26","","","320","320","1","30.25","0","0","0","9680","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("343","1","27","","","16","16","1","170","0","0","0","2720","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("344","1","28","","","123","123","1","251.35","0","0","0","30916.05","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("345","1","29","","","14","14","1","70","0","0","0","980","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("346","1","30","","","14","14","1","1400","0","0","0","19600","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("347","1","31","","","185","185","1","80","0","0","0","14800","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("348","1","32","","","100","100","1","26","0","0","0","2600","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("349","1","33","","","86","86","1","88","0","0","0","7568","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("350","1","34","","","31","31","1","300","0","0","0","9300","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("351","1","35","","","19","19","1","285","0","0","0","5415","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("352","1","36","","","90","90","1","145","0","0","0","13050","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("353","1","37","","","37","37","1","0","0","0","0","0","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("354","1","38","","","20","20","1","1375","0","0","0","27500","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("355","1","39","","","41","41","1","1100","0","0","0","45100","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("356","1","40","","","5","5","1","850","0","0","0","4250","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("357","1","41","","","105","105","12","180","0","0","0","18900","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("358","1","42","","","24","24","1","1200","0","0","0","28800","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("359","1","43","","","22","22","1","1250","0","0","0","27500","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("360","1","44","","","1268","1268","1","180","0","0","0","228240","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("361","1","45","","","48","48","1","180","0","0","0","8640","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("362","1","46","","","16","16","1","980","0","0","0","15680","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("363","1","47","","","0","0","1","0","0","0","0","0","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("364","1","48","","","194","194","1","300","0","0","0","58200","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("365","1","49","","","23","23","1","700","0","0","0","16100","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("366","1","50","","","22","22","1","450","0","0","0","9900","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("367","1","51","","","29","29","1","350","0","0","0","10150","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("368","1","52","","","0","0","1","1000","0","0","0","0","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("369","1","53","","","15","15","1","460","0","0","0","6900","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("370","1","54","","","5508","5508","1","25","0","0","0","137700","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("371","1","55","","","46","46","1","400","0","0","0","18400","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_purchases VALUES("372","1","56","","","73","73","1","300","0","0","0","21900","2021-07-29 15:05:05","2021-07-29 15:05:05");
INSERT INTO product_purchases VALUES("373","1","57","","","12","12","1","350","0","0","0","4200","2021-07-29 15:05:05","2021-07-29 15:05:05");
INSERT INTO product_purchases VALUES("374","1","58","","","35","35","1","43","0","0","0","1505","2021-07-29 15:05:05","2021-07-29 15:05:05");
INSERT INTO product_purchases VALUES("375","1","59","","","0","0","1","50","0","0","0","0","2021-07-29 15:05:05","2021-07-29 15:05:05");
INSERT INTO product_purchases VALUES("376","1","60","","","0","0","13","90","0","0","0","0","2021-07-29 15:05:05","2021-07-29 15:05:05");
INSERT INTO product_purchases VALUES("377","1","61","","","0","0","13","91","0","0","0","0","2021-07-29 15:05:05","2021-07-29 15:05:05");
INSERT INTO product_purchases VALUES("378","1","62","","","0","0","13","92","0","0","0","0","2021-07-29 15:05:05","2021-07-29 15:05:05");
INSERT INTO product_purchases VALUES("379","1","63","","","250","250","1","200","0","0","0","50000","2021-07-29 15:05:05","2021-07-29 15:05:05");
INSERT INTO product_purchases VALUES("380","1","64","","","8","8","1","1350","0","0","0","10800","2021-07-29 15:05:05","2021-07-29 15:05:05");
INSERT INTO product_purchases VALUES("381","1","65","","","76","76","1","72","0","0","0","5472","2021-07-29 15:05:05","2021-07-29 15:05:05");
INSERT INTO product_purchases VALUES("382","1","66","","","43","43","1","95","0","0","0","4085","2021-07-29 15:05:05","2021-07-29 15:05:05");
INSERT INTO product_purchases VALUES("383","1","67","","","35","35","1","0","0","0","0","0","2021-07-29 15:05:05","2021-07-29 15:05:05");
INSERT INTO product_purchases VALUES("384","1","68","","","15","15","1","200","0","0","0","3000","2021-07-29 15:05:05","2021-07-29 15:05:05");
INSERT INTO product_purchases VALUES("385","2","64","","","10","10","1","1350","0","0","0","13500","2021-08-04 05:39:50","2021-08-04 05:39:50");
INSERT INTO product_purchases VALUES("386","3","55","","","50","50","1","400","0","0","0","20000","2021-08-04 05:40:44","2021-08-04 05:40:44");
INSERT INTO product_purchases VALUES("387","4","26","","","320","320","12","30.25","0","0","0","9680","2021-08-04 09:16:35","2021-08-04 09:16:35");
INSERT INTO product_purchases VALUES("388","5","57","","","50","50","1","350","0","0","0","17500","2021-08-04 09:34:03","2021-08-04 09:34:03");
INSERT INTO product_purchases VALUES("389","5","60","","","150","150","13","90","0","0","0","13500","2021-08-04 09:34:03","2021-08-04 09:34:03");
INSERT INTO product_purchases VALUES("390","5","69","","","99","99","1","830","0","0","0","82170","2021-08-04 09:34:03","2021-08-04 09:34:03");
INSERT INTO product_purchases VALUES("391","5","50","","","100","100","1","450","0","0","0","45000","2021-08-04 09:34:03","2021-08-04 09:34:03");



CREATE TABLE `product_quotation` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `quotation_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_batch_id` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_returns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `return_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_batch_id` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_sales` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_batch_id` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_sales VALUES("1","1","2","","","1","1","5935","0","0","0","5935","2021-12-01 13:40:06","2021-12-01 13:40:06");
INSERT INTO product_sales VALUES("2","1","1","","","3","1","14244","0","0","0","42732","2021-12-01 13:40:06","2021-12-01 13:40:06");
INSERT INTO product_sales VALUES("3","2","6","","","1","1","7596.8","0","0","0","7596.8","2021-12-01 17:25:27","2021-12-01 17:25:27");
INSERT INTO product_sales VALUES("4","2","1","","","1","1","14244","0","0","0","14244","2021-12-01 17:25:28","2021-12-01 17:25:28");
INSERT INTO product_sales VALUES("5","3","1","","","2","1","14244","0","0","0","28488","2021-12-01 18:28:46","2021-12-01 18:28:46");
INSERT INTO product_sales VALUES("6","4","1","","","1","1","14244","0","0","0","14244","2021-12-01 18:32:00","2021-12-01 18:32:00");
INSERT INTO product_sales VALUES("7","5","1","","","1","1","14244","0","0","0","14244","2021-12-01 18:33:04","2021-12-01 18:33:04");
INSERT INTO product_sales VALUES("8","6","1","","","1","1","14244","0","0","0","14244","2021-12-01 18:33:49","2021-12-01 18:33:49");
INSERT INTO product_sales VALUES("9","7","1","","","1","1","14244","0","0","0","14244","2021-12-01 18:34:58","2021-12-01 18:34:58");
INSERT INTO product_sales VALUES("10","8","6","","","4","1","7596.8","0","0","0","30387.2","2021-12-04 11:47:32","2021-12-04 11:47:32");
INSERT INTO product_sales VALUES("11","8","2","","","3","1","5935","0","0","0","17805","2021-12-04 11:47:34","2021-12-04 11:47:34");
INSERT INTO product_sales VALUES("12","8","1","","","1","1","14244","0","0","0","14244","2021-12-04 11:47:35","2021-12-04 11:47:35");



CREATE TABLE `product_transfer` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transfer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_batch_id` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int NOT NULL,
  `net_unit_cost` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_variants` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `variant_id` int NOT NULL,
  `position` int NOT NULL,
  `item_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_price` double DEFAULT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_warehouse` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_batch_id` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `warehouse_id` int NOT NULL,
  `qty` double NOT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_warehouse VALUES("57","1","","","1","71","","2021-07-29 15:05:04","2021-12-04 11:47:35");
INSERT INTO product_warehouse VALUES("58","2","","","1","33","","2021-07-29 15:05:04","2021-12-04 11:47:33");
INSERT INTO product_warehouse VALUES("59","3","","","1","0","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("60","4","","","1","44","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("61","5","","","1","26","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("62","6","","","1","22","","2021-07-29 15:05:04","2021-12-04 11:47:31");
INSERT INTO product_warehouse VALUES("63","7","","","1","62","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("64","8","","","1","240","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("65","9","","","1","87","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("66","10","","","1","0","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("67","11","","","1","197","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("68","12","","","1","0","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("69","13","","","1","23","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("70","14","","","1","40","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("71","15","","","1","1975","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("72","16","","","1","29","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("73","17","","","1","750","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("74","18","","","1","75","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("75","19","","","1","90","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("76","20","","","1","114","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("77","21","","","1","90","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("78","22","","","1","28","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("79","23","","","1","9","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("80","24","","","1","33","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("81","25","","","1","120","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("82","26","","","1","640","","2021-07-29 15:05:04","2021-08-04 09:16:35");
INSERT INTO product_warehouse VALUES("83","27","","","1","16","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("84","28","","","1","123","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("85","29","","","1","14","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("86","30","","","1","14","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("87","31","","","1","185","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("88","32","","","1","100","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("89","33","","","1","86","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("90","34","","","1","31","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("91","35","","","1","19","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("92","36","","","1","90","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("93","37","","","1","37","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("94","38","","","1","20","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("95","39","","","1","41","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("96","40","","","1","5","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("97","41","","","1","105","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("98","42","","","1","24","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("99","43","","","1","22","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("100","44","","","1","1268","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("101","45","","","1","48","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("102","46","","","1","16","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("103","47","","","1","0","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("104","48","","","1","194","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("105","49","","","1","23","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("106","50","","","1","122","","2021-07-29 15:05:04","2021-08-04 09:34:03");
INSERT INTO product_warehouse VALUES("107","51","","","1","29","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("108","52","","","1","0","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("109","53","","","1","15","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("110","54","","","1","5508","","2021-07-29 15:05:04","2021-07-29 15:05:04");
INSERT INTO product_warehouse VALUES("111","55","","","1","96","","2021-07-29 15:05:04","2021-08-04 05:40:44");
INSERT INTO product_warehouse VALUES("112","56","","","1","73","","2021-07-29 15:05:05","2021-07-29 15:05:05");
INSERT INTO product_warehouse VALUES("113","57","","","1","62","","2021-07-29 15:05:05","2021-08-04 09:34:03");
INSERT INTO product_warehouse VALUES("114","58","","","1","35","","2021-07-29 15:05:05","2021-07-29 15:05:05");
INSERT INTO product_warehouse VALUES("115","59","","","1","0","","2021-07-29 15:05:05","2021-07-29 15:05:05");
INSERT INTO product_warehouse VALUES("116","60","","","1","150","","2021-07-29 15:05:05","2021-08-04 09:34:03");
INSERT INTO product_warehouse VALUES("117","61","","","1","0","","2021-07-29 15:05:05","2021-07-29 15:05:05");
INSERT INTO product_warehouse VALUES("118","62","","","1","0","","2021-07-29 15:05:05","2021-07-29 15:05:05");
INSERT INTO product_warehouse VALUES("119","63","","","1","250","","2021-07-29 15:05:05","2021-07-29 15:05:05");
INSERT INTO product_warehouse VALUES("120","64","","","1","18","","2021-07-29 15:05:05","2021-08-04 05:39:50");
INSERT INTO product_warehouse VALUES("121","65","","","1","76","","2021-07-29 15:05:05","2021-07-29 15:05:05");
INSERT INTO product_warehouse VALUES("122","66","","","1","43","","2021-07-29 15:05:05","2021-07-29 15:05:05");
INSERT INTO product_warehouse VALUES("123","67","","","1","35","","2021-07-29 15:05:05","2021-07-29 15:05:05");
INSERT INTO product_warehouse VALUES("124","68","","","1","15","","2021-07-29 15:05:05","2021-07-29 15:05:05");
INSERT INTO product_warehouse VALUES("125","69","","","1","99","","2021-08-04 09:34:03","2021-08-04 09:34:03");



CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_symbology` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` int DEFAULT NULL,
  `category_id` int NOT NULL,
  `unit_id` int NOT NULL,
  `purchase_unit_id` int NOT NULL,
  `sale_unit_id` int NOT NULL,
  `cost` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` double DEFAULT NULL,
  `alert_quantity` double DEFAULT NULL,
  `promotion` tinyint DEFAULT NULL,
  `promotion_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starting_date` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `tax_id` int DEFAULT NULL,
  `tax_method` int DEFAULT NULL,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_variant` tinyint(1) DEFAULT NULL,
  `is_batch` tinyint(1) DEFAULT NULL,
  `is_diffPrice` tinyint(1) DEFAULT NULL,
  `featured` tinyint DEFAULT NULL,
  `product_list` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_list` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_list` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_list` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO products VALUES("1","Tramadol capsulas 50 mg x 100","10001","standard","C128","","1","1","1","1","320","600","71","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-12-04 11:47:35");
INSERT INTO products VALUES("2","Diclofenaco Potásico de 50 mg x 100 tabletas","10002","standard","C128","","1","1","1","1","190","250","33","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-12-04 11:47:33");
INSERT INTO products VALUES("3","Glibenclamida 5 mg x 100 tabletas","10003","standard","C128","","1","1","1","1","30","45","0","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 14:38:43");
INSERT INTO products VALUES("4","Sulfato Ferroso x100 tabletas","10004","standard","C128","","1","1","1","1","44","45","44","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("5","Metformina 850 mg x 100 tabletas","10005","standard","C128","","1","1","1","1","85","130","26","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("6","Naproxeno 500 mg x 100 tabletas","10006","standard","C128","","1","1","1","1","180","320","22","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-12-04 11:47:30");
INSERT INTO products VALUES("7","Ibesartan 300 mg x 100 tabletas","10007","standard","C128","","1","1","1","1","400","500","62","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("8","Diazepam x 1 Ampolla","10008","standard","C128","","1","12","12","12","32","45","240","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("9","Nomagest x 1 Ampolla","10009","standard","C128","","1","12","12","12","57","100","87","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("10","Vick lata","10010","standard","C128","","1","13","13","13","0","55","0","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 14:38:43");
INSERT INTO products VALUES("11","Vick tarro pequeño","10011","standard","C128","","1","13","13","13","43","190","197","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("12","Ibuprofeno 600 mg x 100 tabletas","10012","standard","C128","","1","1","1","1","0","0","0","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 14:38:43");
INSERT INTO products VALUES("13","Traxil 0.5 MG X 30 tabletas","10013","standard","C128","","1","1","1","1","232.04","273","23","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("14","Rebasin de 2 mg x 30 tabletas","10014","standard","C128","","1","1","1","1","231.95","297.7","40","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("15","Nitasox 500 mg x 6 tabletas","10015","standard","C128","","1","1","1","1","88.85","115","1975","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("16","Nitasox jarabe 100 mg x 30 ml","10016","standard","C128","","1","13","13","13","48.69","61","29","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("17","Ultra Doceplex 1 ampolla","10017","standard","C128","","1","12","12","12","74.5","85","750","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("18","Omeprazol capsulas 20 mg x 100 cápsulas","10018","standard","C128","","1","1","1","1","85","170","75","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("19","Dicloxacilina 500 mg x 100 cápsulas","10019","standard","C128","","1","1","1","1","200","400","90","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("20","Lanzoprazol 30 mg x 100 cápsulas","10020","standard","C128","","1","1","1","1","140","114","114","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("21","Sil-norboral 5 mg/1000 mg x 40 tabletas","10021","standard","C128","","1","1","1","1","240","310","90","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("22","diclofenac potasico 50 mg x 100 tabletas","10022","standard","C128","","1","1","1","1","35","70","28","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("23","Spasmo - Urolong x 100 tabletas","10023","standard","C128","","1","1","1","1","950","1200","9","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("24","Hierro Vit frasco 240 ml","10024","standard","C128","","1","13","13","13","43","48","33","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("25","Nikozon x 90 tabletas","10025","standard","C128","","1","1","1","1","435","500","120","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("26","Indulan inyectable X20 ampollas 50MG/2ML","10026","standard","C128","","1","12","12","12","30.25","38","640","","","","","","","1","1628097322199Indulan.jpg","","","1","0","0","","","","","","1","2021-07-29 14:38:43","2021-12-04 12:10:00");
INSERT INTO products VALUES("27","Ranitidina x 100 tabletas","10027","standard","C128","","1","1","1","1","170","300","16","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("28","N-soñodor 50gm x 30 tabletas","10028","standard","C128","","1","1","1","1","251.35","380","123","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("29","Acido Mefenamico 50 gm x 100 tabletas","10029","standard","C128","","1","1","1","1","70","150","14","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("30","Avamigran x 200 tabletas","10030","standard","C128","","1","1","1","1","1400","1600","14","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("31","Amoxicilina 500 mg x 100 capsulas","10031","standard","C128","","1","1","1","1","80","120","185","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("32","Amoxicilina 250 mg suspension 100 ml","10032","standard","C128","","1","1","1","1","26","32","100","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("33","Ampicilina 500 mg x 100 cápsula","10033","standard","C128","","1","1","1","1","88","120","86","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("34","Amikacina 500 mg / 2 ml x 10 ampollas","10034","standard","C128","","1","1","1","1","300","350","31","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("35","Astymin suero 200 ml","10035","standard","C128","","1","1","1","1","285","340","19","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("36","Aspirina niño x 100 tabletas","10036","standard","C128","","1","1","1","1","145","155","90","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("37","Acido Folico","10037","standard","C128","","1","1","1","1","0","25","37","","","","","","","1","zummXD2dvAtI.png","","","","0","0","","","","","","1","2021-07-29 14:38:43","2021-07-30 10:37:15");
INSERT INTO products VALUES("38","Dolo Neurobion XR 60 tabletas","10038","standard","C128","","1","1","1","1","1375","1550","20","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("39","Dolo Neurobion N 120 tabletas","10039","standard","C128","","1","1","1","1","1100","1200","41","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("40","Neurobion x 120 tabletas","10040","standard","C128","","1","1","1","1","850","1050","5","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("41","Dolo Neurobion x 1 ampolla","10041","standard","C128","","1","12","12","12","180","200","105","","","","","","","1","zummXD2dvAtI.png","","","","0","0","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("42","Matrix x 50 tabletas","10042","standard","C128","","1","1","1","1","1200","1500","24","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("43","Oxa Forte x 50 grageas","10043","standard","C128","","1","1","1","1","1250","1700","22","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("44","Lisalgil x 3 ampollas","10044","standard","C128","","1","1","1","1","180","210","1268","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("45","Sertal Compuesto x 3 ampollas","10045","standard","C128","","1","1","1","1","180","210","48","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("46","Sertal Compuesto x 200 tabletas","10046","standard","C128","","1","1","1","1","980","1200","16","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("47","Rivotril gotas 10 ml","10047","standard","C128","","1","1","1","1","0","0","0","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 14:38:43");
INSERT INTO products VALUES("48","Rivotril 2mg x 30 comprimidos","10048","standard","C128","","1","1","1","1","300","390","194","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("49","Dexametasona 4 mg x 100 ampolla","10049","standard","C128","","1","1","1","1","700","850","23","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("50","Enantyum 25 mg x 20 tabletas","10050","standard","C128","","1","1","1","1","450","550","122","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-08-04 09:34:03");
INSERT INTO products VALUES("51","Sargenor Forte x 10 ampolla bebibles","10051","standard","C128","","1","1","1","1","350","500","29","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("52","Perlas x 24 ciclos","10052","standard","C128","","1","1","1","1","1000","1200","0","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 14:38:43");
INSERT INTO products VALUES("53","Plan B x 13 sobres","10053","standard","C128","","1","1","1","1","460","700","15","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("54","Lusia-F x 1 blister","10054","standard","C128","","1","1","1","1","25","30","5508","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:04");
INSERT INTO products VALUES("55","Melex x 30 tabletas","10055","standard","C128","","1","1","1","1","400","430","96","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-08-04 05:40:44");
INSERT INTO products VALUES("56","Menaxol Forte x 10 sobres","10056","standard","C128","","1","1","1","1","300","330","73","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:05");
INSERT INTO products VALUES("57","Daflon 500 mg x 30 tabletas","10057","standard","C128","","1","1","1","1","350","500","62","","","","","","","1","zummXD2dvAtI.png","","","","0","0","","","","","","1","2021-07-29 14:38:43","2021-08-04 09:34:03");
INSERT INTO products VALUES("58","Sudagrip x 1 ampolla","10058","standard","C128","","1","1","1","1","43","65","35","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:05");
INSERT INTO products VALUES("59","Zegra 100 mg x 4 tabletas","10059","standard","C128","","1","1","1","1","50","100","0","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 14:38:43");
INSERT INTO products VALUES("60","Blancoderm Avena 75 gramos","10060","standard","C128","","1","13","13","13","90","120","150","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-08-04 09:34:03");
INSERT INTO products VALUES("61","Blancoderm Aloe Vera 75 gramos","10061","standard","C128","","1","13","13","13","91","121","0","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 14:38:43");
INSERT INTO products VALUES("62","Blancoderm Clasica 75 gramos","10062","standard","C128","","1","13","13","13","92","122","0","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 14:38:43");
INSERT INTO products VALUES("63","Tramadol x 10 ampollas","10063","standard","C128","","1","1","1","1","200","350","250","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:05");
INSERT INTO products VALUES("64","Migradorixina x 200 tabletas","10064","standard","C128","","1","1","1","1","1350","1600","18","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-08-04 05:39:50");
INSERT INTO products VALUES("65","Peptobismol pequeño 118 ml","10065","standard","C128","","1","1","1","1","72","80","76","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:05");
INSERT INTO products VALUES("66","Ciprofoxacina 500 mg x 100 tab","10066","standard","C128","","1","1","1","1","95","200","43","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:05");
INSERT INTO products VALUES("67","Vitamina K x 25 ampollas","10067","standard","C128","","1","1","1","1","0","40","35","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:05");
INSERT INTO products VALUES("68","Sucrassyl x 30 sobres","10068","standard","C128","","1","1","1","1","200","280","15","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","1","2021-07-29 14:38:43","2021-07-29 15:05:05");
INSERT INTO products VALUES("69","Enantyum Plus","10069","standard","C128","","1","1","1","1","830","930","99","20","","","","","","1","1628112645136enantyum.jpeg","","","","","","","","","","","1","2021-08-04 09:31:06","2021-08-04 09:34:03");



CREATE TABLE `purchase_product_return` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `return_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_batch_id` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `purchases` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `supplier_id` int DEFAULT NULL,
  `item` int NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `paid_amount` double NOT NULL,
  `status` int NOT NULL,
  `payment_status` int NOT NULL,
  `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO purchases VALUES("1","pr-20210729-090504","1","1","","68","13146","0","0","1340201.73","0","0","","","1340201.73","1340201.73","1","2","","","2021-07-29 15:05:04","2021-07-29 15:06:28");
INSERT INTO purchases VALUES("2","pr-20210804-113950","1","1","","1","10","0","0","13500","0","0","","","13500","13500","1","2","","","2021-08-04 05:39:50","2021-08-04 05:41:55");
INSERT INTO purchases VALUES("3","pr-20210804-114044","1","1","","1","50","0","0","20000","0","0","","","20000","20000","1","2","","","2021-08-04 05:40:44","2021-08-04 05:41:41");
INSERT INTO purchases VALUES("4","pr-20210804-031635","1","1","1","1","320","0","0","9680","0","0","","","9680","9680","1","2","Factura-Lancasco-22-07-21.jpeg","El consto no es 33.42 porque hay otros descuentos no detallados.","2021-08-04 09:16:35","2021-08-04 09:16:46");
INSERT INTO purchases VALUES("5","pr-20210804-033403","1","1","","4","399","0","0","158170","0","0","","","158170","158170","1","2","","","2021-08-04 09:34:03","2021-08-04 09:34:12");



CREATE TABLE `quotations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `biller_id` int NOT NULL,
  `supplier_id` int DEFAULT NULL,
  `customer_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `item` int NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `quotation_status` int NOT NULL,
  `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `return_purchases` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` int DEFAULT NULL,
  `warehouse_id` int NOT NULL,
  `user_id` int NOT NULL,
  `account_id` int NOT NULL,
  `item` int NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `staff_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `returns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `cash_register_id` int DEFAULT NULL,
  `customer_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `biller_id` int NOT NULL,
  `account_id` int NOT NULL,
  `item` int NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `staff_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `reward_point_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `per_point_amount` double NOT NULL,
  `minimum_amount` double NOT NULL,
  `duration` int DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO reward_point_settings VALUES("1","10000","5000","20","Month","0","","2021-07-30 09:07:53");



CREATE TABLE `role_has_permissions` (
  `permission_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO role_has_permissions VALUES("4","1");
INSERT INTO role_has_permissions VALUES("5","1");
INSERT INTO role_has_permissions VALUES("6","1");
INSERT INTO role_has_permissions VALUES("7","1");
INSERT INTO role_has_permissions VALUES("8","1");
INSERT INTO role_has_permissions VALUES("9","1");
INSERT INTO role_has_permissions VALUES("10","1");
INSERT INTO role_has_permissions VALUES("11","1");
INSERT INTO role_has_permissions VALUES("12","1");
INSERT INTO role_has_permissions VALUES("13","1");
INSERT INTO role_has_permissions VALUES("14","1");
INSERT INTO role_has_permissions VALUES("15","1");
INSERT INTO role_has_permissions VALUES("16","1");
INSERT INTO role_has_permissions VALUES("17","1");
INSERT INTO role_has_permissions VALUES("18","1");
INSERT INTO role_has_permissions VALUES("19","1");
INSERT INTO role_has_permissions VALUES("20","1");
INSERT INTO role_has_permissions VALUES("21","1");
INSERT INTO role_has_permissions VALUES("22","1");
INSERT INTO role_has_permissions VALUES("23","1");
INSERT INTO role_has_permissions VALUES("24","1");
INSERT INTO role_has_permissions VALUES("25","1");
INSERT INTO role_has_permissions VALUES("26","1");
INSERT INTO role_has_permissions VALUES("27","1");
INSERT INTO role_has_permissions VALUES("28","1");
INSERT INTO role_has_permissions VALUES("29","1");
INSERT INTO role_has_permissions VALUES("30","1");
INSERT INTO role_has_permissions VALUES("31","1");
INSERT INTO role_has_permissions VALUES("32","1");
INSERT INTO role_has_permissions VALUES("33","1");
INSERT INTO role_has_permissions VALUES("34","1");
INSERT INTO role_has_permissions VALUES("35","1");
INSERT INTO role_has_permissions VALUES("36","1");
INSERT INTO role_has_permissions VALUES("37","1");
INSERT INTO role_has_permissions VALUES("38","1");
INSERT INTO role_has_permissions VALUES("39","1");
INSERT INTO role_has_permissions VALUES("40","1");
INSERT INTO role_has_permissions VALUES("41","1");
INSERT INTO role_has_permissions VALUES("42","1");
INSERT INTO role_has_permissions VALUES("43","1");
INSERT INTO role_has_permissions VALUES("44","1");
INSERT INTO role_has_permissions VALUES("45","1");
INSERT INTO role_has_permissions VALUES("46","1");
INSERT INTO role_has_permissions VALUES("47","1");
INSERT INTO role_has_permissions VALUES("48","1");
INSERT INTO role_has_permissions VALUES("49","1");
INSERT INTO role_has_permissions VALUES("50","1");
INSERT INTO role_has_permissions VALUES("51","1");
INSERT INTO role_has_permissions VALUES("52","1");
INSERT INTO role_has_permissions VALUES("53","1");
INSERT INTO role_has_permissions VALUES("54","1");
INSERT INTO role_has_permissions VALUES("55","1");
INSERT INTO role_has_permissions VALUES("56","1");
INSERT INTO role_has_permissions VALUES("57","1");
INSERT INTO role_has_permissions VALUES("58","1");
INSERT INTO role_has_permissions VALUES("59","1");
INSERT INTO role_has_permissions VALUES("60","1");
INSERT INTO role_has_permissions VALUES("61","1");
INSERT INTO role_has_permissions VALUES("62","1");
INSERT INTO role_has_permissions VALUES("63","1");
INSERT INTO role_has_permissions VALUES("64","1");
INSERT INTO role_has_permissions VALUES("65","1");
INSERT INTO role_has_permissions VALUES("66","1");
INSERT INTO role_has_permissions VALUES("67","1");
INSERT INTO role_has_permissions VALUES("68","1");
INSERT INTO role_has_permissions VALUES("69","1");
INSERT INTO role_has_permissions VALUES("70","1");
INSERT INTO role_has_permissions VALUES("71","1");
INSERT INTO role_has_permissions VALUES("72","1");
INSERT INTO role_has_permissions VALUES("73","1");
INSERT INTO role_has_permissions VALUES("74","1");
INSERT INTO role_has_permissions VALUES("75","1");
INSERT INTO role_has_permissions VALUES("76","1");
INSERT INTO role_has_permissions VALUES("77","1");
INSERT INTO role_has_permissions VALUES("78","1");
INSERT INTO role_has_permissions VALUES("79","1");
INSERT INTO role_has_permissions VALUES("80","1");
INSERT INTO role_has_permissions VALUES("81","1");
INSERT INTO role_has_permissions VALUES("82","1");
INSERT INTO role_has_permissions VALUES("83","1");
INSERT INTO role_has_permissions VALUES("84","1");
INSERT INTO role_has_permissions VALUES("85","1");
INSERT INTO role_has_permissions VALUES("86","1");
INSERT INTO role_has_permissions VALUES("87","1");
INSERT INTO role_has_permissions VALUES("88","1");
INSERT INTO role_has_permissions VALUES("89","1");
INSERT INTO role_has_permissions VALUES("90","1");
INSERT INTO role_has_permissions VALUES("91","1");
INSERT INTO role_has_permissions VALUES("92","1");
INSERT INTO role_has_permissions VALUES("93","1");
INSERT INTO role_has_permissions VALUES("94","1");
INSERT INTO role_has_permissions VALUES("95","1");
INSERT INTO role_has_permissions VALUES("96","1");
INSERT INTO role_has_permissions VALUES("97","1");
INSERT INTO role_has_permissions VALUES("98","1");
INSERT INTO role_has_permissions VALUES("99","1");
INSERT INTO role_has_permissions VALUES("100","1");
INSERT INTO role_has_permissions VALUES("101","1");
INSERT INTO role_has_permissions VALUES("102","1");
INSERT INTO role_has_permissions VALUES("103","1");
INSERT INTO role_has_permissions VALUES("104","1");
INSERT INTO role_has_permissions VALUES("105","1");
INSERT INTO role_has_permissions VALUES("4","2");
INSERT INTO role_has_permissions VALUES("5","2");
INSERT INTO role_has_permissions VALUES("6","2");
INSERT INTO role_has_permissions VALUES("7","2");
INSERT INTO role_has_permissions VALUES("8","2");
INSERT INTO role_has_permissions VALUES("9","2");
INSERT INTO role_has_permissions VALUES("10","2");
INSERT INTO role_has_permissions VALUES("11","2");
INSERT INTO role_has_permissions VALUES("12","2");
INSERT INTO role_has_permissions VALUES("13","2");
INSERT INTO role_has_permissions VALUES("14","2");
INSERT INTO role_has_permissions VALUES("15","2");
INSERT INTO role_has_permissions VALUES("16","2");
INSERT INTO role_has_permissions VALUES("17","2");
INSERT INTO role_has_permissions VALUES("18","2");
INSERT INTO role_has_permissions VALUES("19","2");
INSERT INTO role_has_permissions VALUES("20","2");
INSERT INTO role_has_permissions VALUES("21","2");
INSERT INTO role_has_permissions VALUES("22","2");
INSERT INTO role_has_permissions VALUES("23","2");
INSERT INTO role_has_permissions VALUES("24","2");
INSERT INTO role_has_permissions VALUES("25","2");
INSERT INTO role_has_permissions VALUES("26","2");
INSERT INTO role_has_permissions VALUES("27","2");
INSERT INTO role_has_permissions VALUES("28","2");
INSERT INTO role_has_permissions VALUES("29","2");
INSERT INTO role_has_permissions VALUES("30","2");
INSERT INTO role_has_permissions VALUES("31","2");
INSERT INTO role_has_permissions VALUES("32","2");
INSERT INTO role_has_permissions VALUES("33","2");
INSERT INTO role_has_permissions VALUES("34","2");
INSERT INTO role_has_permissions VALUES("35","2");
INSERT INTO role_has_permissions VALUES("36","2");
INSERT INTO role_has_permissions VALUES("37","2");
INSERT INTO role_has_permissions VALUES("38","2");
INSERT INTO role_has_permissions VALUES("39","2");
INSERT INTO role_has_permissions VALUES("40","2");
INSERT INTO role_has_permissions VALUES("41","2");
INSERT INTO role_has_permissions VALUES("42","2");
INSERT INTO role_has_permissions VALUES("43","2");
INSERT INTO role_has_permissions VALUES("44","2");
INSERT INTO role_has_permissions VALUES("45","2");
INSERT INTO role_has_permissions VALUES("46","2");
INSERT INTO role_has_permissions VALUES("47","2");
INSERT INTO role_has_permissions VALUES("48","2");
INSERT INTO role_has_permissions VALUES("49","2");
INSERT INTO role_has_permissions VALUES("50","2");
INSERT INTO role_has_permissions VALUES("51","2");
INSERT INTO role_has_permissions VALUES("52","2");
INSERT INTO role_has_permissions VALUES("53","2");
INSERT INTO role_has_permissions VALUES("54","2");
INSERT INTO role_has_permissions VALUES("55","2");
INSERT INTO role_has_permissions VALUES("56","2");
INSERT INTO role_has_permissions VALUES("57","2");
INSERT INTO role_has_permissions VALUES("58","2");
INSERT INTO role_has_permissions VALUES("59","2");
INSERT INTO role_has_permissions VALUES("60","2");
INSERT INTO role_has_permissions VALUES("61","2");
INSERT INTO role_has_permissions VALUES("62","2");
INSERT INTO role_has_permissions VALUES("63","2");
INSERT INTO role_has_permissions VALUES("64","2");
INSERT INTO role_has_permissions VALUES("65","2");
INSERT INTO role_has_permissions VALUES("66","2");
INSERT INTO role_has_permissions VALUES("67","2");
INSERT INTO role_has_permissions VALUES("68","2");
INSERT INTO role_has_permissions VALUES("69","2");
INSERT INTO role_has_permissions VALUES("70","2");
INSERT INTO role_has_permissions VALUES("71","2");
INSERT INTO role_has_permissions VALUES("72","2");
INSERT INTO role_has_permissions VALUES("73","2");
INSERT INTO role_has_permissions VALUES("74","2");
INSERT INTO role_has_permissions VALUES("75","2");
INSERT INTO role_has_permissions VALUES("76","2");
INSERT INTO role_has_permissions VALUES("77","2");
INSERT INTO role_has_permissions VALUES("78","2");
INSERT INTO role_has_permissions VALUES("79","2");
INSERT INTO role_has_permissions VALUES("80","2");
INSERT INTO role_has_permissions VALUES("81","2");
INSERT INTO role_has_permissions VALUES("82","2");
INSERT INTO role_has_permissions VALUES("83","2");
INSERT INTO role_has_permissions VALUES("84","2");
INSERT INTO role_has_permissions VALUES("85","2");
INSERT INTO role_has_permissions VALUES("86","2");
INSERT INTO role_has_permissions VALUES("87","2");
INSERT INTO role_has_permissions VALUES("88","2");
INSERT INTO role_has_permissions VALUES("89","2");
INSERT INTO role_has_permissions VALUES("90","2");
INSERT INTO role_has_permissions VALUES("91","2");
INSERT INTO role_has_permissions VALUES("92","2");
INSERT INTO role_has_permissions VALUES("93","2");
INSERT INTO role_has_permissions VALUES("94","2");
INSERT INTO role_has_permissions VALUES("95","2");
INSERT INTO role_has_permissions VALUES("96","2");
INSERT INTO role_has_permissions VALUES("97","2");
INSERT INTO role_has_permissions VALUES("98","2");
INSERT INTO role_has_permissions VALUES("99","2");
INSERT INTO role_has_permissions VALUES("100","2");
INSERT INTO role_has_permissions VALUES("101","2");
INSERT INTO role_has_permissions VALUES("102","2");
INSERT INTO role_has_permissions VALUES("103","2");
INSERT INTO role_has_permissions VALUES("104","2");
INSERT INTO role_has_permissions VALUES("105","2");
INSERT INTO role_has_permissions VALUES("4","4");
INSERT INTO role_has_permissions VALUES("6","4");
INSERT INTO role_has_permissions VALUES("7","4");
INSERT INTO role_has_permissions VALUES("8","4");
INSERT INTO role_has_permissions VALUES("9","4");
INSERT INTO role_has_permissions VALUES("12","4");
INSERT INTO role_has_permissions VALUES("13","4");
INSERT INTO role_has_permissions VALUES("20","4");
INSERT INTO role_has_permissions VALUES("21","4");
INSERT INTO role_has_permissions VALUES("22","4");
INSERT INTO role_has_permissions VALUES("24","4");
INSERT INTO role_has_permissions VALUES("25","4");
INSERT INTO role_has_permissions VALUES("28","4");
INSERT INTO role_has_permissions VALUES("29","4");
INSERT INTO role_has_permissions VALUES("55","4");
INSERT INTO role_has_permissions VALUES("56","4");
INSERT INTO role_has_permissions VALUES("57","4");
INSERT INTO role_has_permissions VALUES("63","4");
INSERT INTO role_has_permissions VALUES("64","4");



CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO roles VALUES("1","Admin","Puede acceder a todos los datos","web","1","2018-06-01 17:46:44","2021-07-29 05:49:08");
INSERT INTO roles VALUES("2","Dueño","Dueños de la empresa","web","1","2018-10-21 20:38:13","2021-07-29 05:49:45");
INSERT INTO roles VALUES("4","Empliado","Empleado con acceso especifico","web","1","2018-06-01 18:05:27","2021-07-29 05:50:16");
INSERT INTO roles VALUES("5","Cliente","","web","1","2020-11-05 00:43:16","2021-07-29 05:50:27");



CREATE TABLE `sales` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `cash_register_id` int DEFAULT NULL,
  `customer_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `period_id` int NOT NULL,
  `biller_id` int DEFAULT NULL,
  `item` int NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `grand_total` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `coupon_id` int DEFAULT NULL,
  `coupon_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `sale_status` int NOT NULL,
  `payment_status` int NOT NULL,
  `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `sale_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `staff_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO sales VALUES("1","001-001-01-00000001","46","1","1","1","1","10","2","4","0","0","48667","48667","0","0","","","","","1","4","","48667","","","2021-12-01 13:40:05","2021-12-01 13:40:05");
INSERT INTO sales VALUES("2","001-001-01-00000002","46","1","1","1","1","10","2","2","0","0","21840.8","21840.8","0","0","","","","","1","4","","21840.8","","","2021-12-01 17:25:27","2021-12-01 17:25:27");
INSERT INTO sales VALUES("3","001-001-01-00000003","46","1","1","1","1","10","1","2","0","0","28488","28488","0","0","","","","","1","4","","28488","","","2021-12-01 18:28:45","2021-12-01 18:28:45");
INSERT INTO sales VALUES("4","001-001-01-00000004","46","1","1","1","1","10","1","1","0","0","14244","14244","0","0","","","","","1","4","","14244","","","2021-12-01 18:31:58","2021-12-01 18:31:58");
INSERT INTO sales VALUES("5","001-001-01-00000005","46","1","1","1","1","10","1","1","0","0","14244","14244","0","0","","","","","1","4","","14244","safdas","sadfas","2021-12-01 18:33:03","2021-12-01 18:33:03");
INSERT INTO sales VALUES("6","001-001-01-00000006","46","1","1","1","1","10","1","1","0","0","14244","14244","0","0","","","","","1","4","","14244","wqerqwerqwerqwerqewereqwrqewer","wqerqewrqwreqwer","2021-12-01 18:33:49","2021-12-01 18:33:49");
INSERT INTO sales VALUES("7","001-001-01-00000007","46","1","1","1","1","10","1","1","0","0","14244","14244","0","0","","","","","1","4","","14244","222222222222222222222","333333333333333333","2021-12-01 18:34:58","2021-12-01 18:34:58");
INSERT INTO sales VALUES("8","001-001-01-00000008","1","2","1","1","1","1","3","8","0","0","62436.2","62436.2","0","0","","","","","1","4","","62436.2","","","2021-12-04 11:47:29","2021-12-04 11:47:29");



CREATE TABLE `stock_counts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int NOT NULL,
  `category_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_adjusted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `suppliers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO suppliers VALUES("1","Droguería Lancasco de Honduras S.A. de C.V.","DrogueraLancascodeHondurasSAdeCV.png","Droguería Lancasco de Honduras S.A. de C.V.","","gadministrativo.hn@lancasco.com","+504 25574769","Col. Alameda Ave. Tiburcio Carias Andino, Casa 502","Tegucigalpa","Francisco Morazán","","Honduras","1","2021-08-04 05:27:05","2021-08-04 05:27:05");



CREATE TABLE `taxes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO taxes VALUES("1","ISV 15%","15","1","2018-05-12 03:58:43","2021-07-29 05:43:09");
INSERT INTO taxes VALUES("2","ISV 18%","18","1","2018-08-31 18:58:57","2021-07-29 05:43:18");



CREATE TABLE `transfers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `status` int NOT NULL,
  `from_warehouse_id` int NOT NULL,
  `to_warehouse_id` int NOT NULL,
  `item` int NOT NULL,
  `total_qty` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `units` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `unit_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_unit` int DEFAULT NULL,
  `operator` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_value` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO units VALUES("1","caj.","Caja","","*","1","1","2021-07-29 05:44:10","2021-07-29 14:11:51");
INSERT INTO units VALUES("12","amp.","Ampolla","","*","1","1","2021-07-29 14:11:42","2021-07-29 14:24:05");
INSERT INTO units VALUES("13","und.","Unidad","","*","1","1","2021-07-29 14:12:17","2021-07-29 14:24:14");



CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int NOT NULL,
  `biller_id` int DEFAULT NULL,
  `warehouse_id` int DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES("1","Camilo Alvarado","camilo.alvarado0501@gmail.com","$2y$10$oPMNzRjXKS0/bl5nuxuR1O/9FqFCr0J02iNQufddXm/dNz4G/qroO","AmL1ikM8kWMI3GE3IoyGTMLmU4RjcZzwMcu2vwBU74jKsogoFPL5VeIMGBkx","+50496645637","Emprende en la Web","1","","","1","0","2018-06-01 21:24:15","2021-07-29 05:30:16");
INSERT INTO users VALUES("29","Camilo","emprende.dev@gmail.com","$2y$10$N3w177iVVvAvTgFxKDWf6OTUQVX5ppn15pLkx6OEtMmwmvz4edlcC","","+504 88876032","","1","","","0","1","2021-08-04 09:36:44","2021-08-04 10:04:37");
INSERT INTO users VALUES("30","Emprende","emprende.dev@gmail.com","$2y$10$c7JE6I7brZtrFrkB9XqPEOlvpphTSfdupf/TUGhH.i6Zh9R1EL9uC","","88876032","","1","","","0","1","2021-08-04 10:05:32","2021-08-04 10:07:50");
INSERT INTO users VALUES("31","Emprende","emprende.dev@gmail.com","$2y$10$H3skl2xpE0IkrvzDXp.0i.X0nl8hF1KSKhHLWdBVRku41AmtQGhZi","","87886032","Emprende en la Web","1","","","0","1","2021-08-04 10:08:37","2021-08-04 10:32:28");
INSERT INTO users VALUES("32","Emfasfasf","emprende.dev@gmail.com","$2y$10$0y0xXXISRyxr.gkt8hy.uucYlN.GPFc3nDx82YPghHQwzvFIjcPoe","","557575","safasdf","1","","","0","1","2021-08-04 10:36:22","2021-08-04 10:44:30");
INSERT INTO users VALUES("33","fddasfasfadddd","emprende.dev@gmail.com","$2y$10$9dS.6tkKLR7Nz20VeiHNwecexQKafxg1J1G0t7pYD/dUOlffxIgji","","34535435354","sfasdfasf","1","","","0","1","2021-08-04 10:44:54","2021-08-04 10:49:57");
INSERT INTO users VALUES("34","wewerwewe","emprende.dev@gmail.com","$2y$10$bo9BTMQys0kyW5Diwe5oceyFGoPO96NwHophq2kD.ybsIXWvfgY5S","","2345235425","asfasfasf","1","","","0","1","2021-08-04 10:50:25","2021-08-04 10:54:41");
INSERT INTO users VALUES("35","sadfasdfasdfasdf","emprende.dev@gmail.com","$2y$10$kNFzEweKdq4smU1/fnNlRO4GwgiTMzD/lGlM27/cPtERl9fdqpMVu","","96645637","Señor","1","","","0","1","2021-08-04 10:55:05","2021-08-04 11:03:22");
INSERT INTO users VALUES("36","ffffffasfasfdsafff","emprende.dev@gmail.com","$2y$10$KiRFQjuh3ABfvYIh8HAneu1yTaRjY3UQLzxLEoN68u30ajmqS/w/m","","24123432134214","sdfaasfasfas","1","","","0","1","2021-08-04 11:03:45","2021-08-04 11:09:05");
INSERT INTO users VALUES("37","gggggafasfasdfdas","emprende.dev@gmail.com","$2y$10$9dm2RkiIkw2mG/uxXhhjqOvAiW1Twt9sEfnLJMnLxtN2EuTdYbRV2","","525252352352","sfasfasfasfasdfas","1","","","0","1","2021-08-04 11:09:30","2021-08-04 11:15:45");
INSERT INTO users VALUES("38","sfasfasfasfd","emprende.dev@gmail.com","$2y$10$moKdM03cRlNQ3t0V4uCbweRgww69cxLqodpoCkjnwPQzwqesTzWDS","","4535235235","sfasdfasdfas","1","","","0","1","2021-08-04 11:16:10","2021-08-04 11:19:41");
INSERT INTO users VALUES("39","etwertrewt","emprende.dev@gmail.com","$2y$10$y4VfbM78p5Z6FJ.ozAo.rOm3gbOVsdoKhj283g.gBXIBRPJjdOpFS","","35235245234452","etwertwe","1","","","0","1","2021-08-04 11:20:04","2021-08-04 11:37:27");
INSERT INTO users VALUES("40","sadfasfdasdf","emprende.dev@gmail.com","$2y$10$Clu3bX2I7uZS7f6vfnTjRuo28391qtdfIWoD9dTxds1wYLQjCu3iu","","25252525","asffasdfsdafasdfas","1","","","0","1","2021-08-04 11:37:48","2021-08-04 12:16:59");
INSERT INTO users VALUES("41","safasdfasfffffffff","emprende.dev@gmail.com","$2y$10$zrQ0Bj1d4ef9ndlOmiD2AuPo6nsbqIz0EIZeYHTuuRmTpEoV3HXIm","","325262523","sdfasfasfffffff","1","","","0","1","2021-08-04 12:17:22","2021-08-04 12:25:52");
INSERT INTO users VALUES("42","sdfasfafffffff","emprende.dev@gmail.com","$2y$10$6RxUO9zN66Hi1tJ1/cKa8e156Q2AZ.3eV0u20xYT0vv105HWd13VW","","3535443","asdfasfasasssssss","1","","","0","1","2021-08-04 12:26:23","2021-08-04 12:27:13");
INSERT INTO users VALUES("43","safasdfdas","emprende.dev@gmail.com","$2y$10$CIpce7SeRnA4pC4hdVmcVeTyDo7VACR/UpAd.hnhRQUSq0.xgJSv6","","52355252345","asfasddfsda","1","","","0","1","2021-08-04 12:30:14","2021-08-04 12:31:32");
INSERT INTO users VALUES("44","sfasdfasdfas","emprende.dev@gmail.com","$2y$10$IIsCg8ajojYkkJjDiMzgGuOTln0Anuq8kOJrchOzGnePa42Q8ZcQS","","3452554352","safasfasfasfdasfas","1","","","0","1","2021-08-04 12:31:55","2021-08-04 13:17:53");
INSERT INTO users VALUES("45","Amilcar Girón","amilcargironcc@gmail.com","$2y$10$hMavP2Rt23pX.jdkVwOgzuhT8w.60xoJowvOyhnLnyaH5W54fp.oe","","+50496290642","Inversiones Diversas (INDISA)","2","","","1","0","2021-08-04 13:22:41","2021-08-04 13:22:41");
INSERT INTO users VALUES("46","Jonh Smith","smith.78@hotmail.com","$2y$10$5JyIEE0Moi9.9GG8A1lMAe9UyNpwj5CCRxAISngmdvT5E/bxYF1YW","","96644525","Farmacia","4","10","1","1","0","2021-12-01 13:36:02","2021-12-01 13:36:02");



CREATE TABLE `variants` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `warehouses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO warehouses VALUES("1","Principal","+504 9629-0642","amicargironcc@gmail.com","4ta. Calle, 4ta Ave. Sur Barrio Las Mercedes. El Progreso Yoro.","1","2021-07-29 05:10:41","2021-07-29 05:10:41");

