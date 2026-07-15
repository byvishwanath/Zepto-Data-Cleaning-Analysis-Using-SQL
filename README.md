# Zepto-Data-Cleaning-Analysis-Using-SQL
SQL data analytics project involving data exploration, cleaning, and business insights using a real-world Zepto e-commerce dataset.

📁 Dataset Overview
--------------------------------------------------------
The dataset used in this project was sourced from Kaggle and contains product listings scraped from Zepto's e-commerce platform.

Each row shows a specific version of a product (its SKU). You will see the same product name listed more than once because it might be sold in different sizes, weights, or categories, or with different discounts.


| Column Name | Description |
| --- | --- |
| **`serial_no`** | A unique ID for each product entry (acts as the main key). |
| **`name`** | The product's name as customers see it on the app. |
| **`category`** | The department the product belongs to (e.g., Fruits, Snacks, Beverages). |
| **`mrp`** | The Maximum Retail Price (converted from paise to ₹). |
| **`discountPercent`** | The discount percentage applied to the MRP. |
| **`discountedSellingPrice`** | The final price the customer pays after the discount (converted to ₹). |
| **`availableQuantity`** | The number of units currently left in stock. |
| **`weightInGms`** | The weight of the product measured in grams. |
| **`outOfStock`** | A true/false flag showing whether the item is sold out. |
| **`quantity`** | The number of items in a pack (or mixed with grams for loose items). |

🧹 Data Cleaning
Added an auto-increment primary key (serial_no).
Checked for missing (NULL) values.
Identified and removed invalid price records.
Standardized price values by converting paise to rupees.
Validated data after cleaning.
Verified maximum and minimum values to detect anomalies.
Checked for duplicate product entries.
Validated product categories and stock availability.

📊 Data Analysis
Total inventory and product count.
Category-wise product distribution.
In-stock vs out-of-stock analysis.
Top discounted products.
Highest and lowest priced products.
Discount percentage analysis.
Category-wise average pricing.
Premium product identification.
Inventory value estimation.
Business insights and recommendations.

-----------------------------------------------------

How to Run
Clone this repository.
git clone https://github.com/byvishwanath/Zepto-Data-Cleaning-Analysis-Using-SQL

-------------------------------------------------------
Author
Vishwanath Bavandla
----------------------------------------------------------
License
This project is intended for educational and portfolio purposes.
