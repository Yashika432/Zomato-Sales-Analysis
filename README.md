# 🍽️ Zomato Sales Analysis Project

This project provides an in-depth sales and restaurant analysis based on Zomato’s dataset. The analysis is done using Excel, SQL, Power BI, and Tableau with a focus on building a data model, transforming data, and generating key performance insights.

---

## 📁 Project Files

- `Zomato Sales Powerbi.pbix` - Power BI Dashboard
- `My final Zomato.xlsx` - Excel data source and model
- `My zomato tableau.twbx` - Tableau visual dashboard
- `zamato_sql_quries_completed.sql` - All SQL queries used
- `.gitattributes` - Git LFS tracking for large files

---

## 📊 Key KPIs & Features

1. **Data Modeling**
   - Built a star schema using Excel sheets
   - Established relationships for accurate analysis

2. **Calendar Table Creation**  
   Using `Datekey_Opening`, generated the following columns:
   - Year
   - Month Number
   - Month Full Name
   - Quarter (Q1–Q4)
   - Year-Month (e.g., 2023-Jan)
   - Weekday Number & Name
   - Financial Month (`FM1` to `FM12`)
   - Financial Quarter (`FQ-1` to `FQ-4`)

3. **Currency Conversion**
   - Converted `Average Cost for 2` from local currencies to USD

4. **Restaurant Metrics**
   - Total number of restaurants by **City** and **Country**
   - Openings by **Year**, **Quarter**, and **Month**
   - Count of restaurants by **Average Ratings**
   - Bucketing restaurants based on **Average Price**

5. **Behavioral Segmentation**
   - % of restaurants with `Has_Table_booking`
   - % of restaurants with `Has_Online_delivery`

6. **Cuisines & Ratings Insights**
   - Charts and trends based on **Cuisine popularity**, **City**, and **Ratings**

7. **Dashboard**
   - An interactive dashboard built to visualize and filter KPIs dynamically

Excel Dashboard
![image](https://github.com/Yashika432/Zomato-Sales-Analysis/blob/main/Excel%20Dashboard%20(2).png)

PowerBi Dashboard
![image](https://github.com/Yashika432/Zomato-Sales-Analysis/blob/main/PowerBI%20Dashboard.png)

Tableau Dashboard
![image](https://github.com/Yashika432/Zomato-Sales-Analysis/blob/main/Tableau%20Dashboard%20(2).png)

---

## 🔍 Tools Used

- **Microsoft Excel** – Power Query, Power Pivot, DAX
- **Power BI** – KPI dashboards and data modeling
- **Tableau** – Alternative visual exploration
- **SQL** – Data transformation and queries
- **Git & Git LFS** – Version control for large files

---

## 💡 Additional KPIs (Exploratory)

Feel free to explore:
- Distribution of Ratings by Price Buckets
- Top Cuisines by Region
- Restaurants with both Online Delivery & Table Booking

---
