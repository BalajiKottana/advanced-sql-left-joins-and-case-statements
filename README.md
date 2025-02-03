# Left Joins and Case conditions go hand in hand to solve typical analytical problems. 
Data, in an enterprise environment often gets accumulated from heterogeneous sources. In the process of gathering information, huge efforts are concentrated on data cleaning and wrangling activities. Even then, we often see some prime attributes with NULL values in our data models. In-order to provide meaningful insights, the downstream pipelines need to handle these unavoidable inconsistencies and provide near to accurate data to the BI dashboards and ML models. In this article, we will make use of one advanced querying technique using left join and case statements, guidelines and benefits of using this to solve analytical problems.
## Problem Statement
We are a wholesale supplier, where we provide items in lots to different retails stores and restaurants. In this sales data model, our sales_fact is surrounded by different dimensions in a star schema as shown in the following figure (fig 1). Our problem statement, is to provide item wise sales on a monthly basis. Looking into problem statement and the data model, one may think it is straight pull grouping sales_fact on item_name and purchase _date.  


![sales_data_model](https://github.com/user-attachments/assets/1e15b262-26b1-4b45-8737-6d99b033210e)
Fig 1: Sales data model 

But once we look into the data, for many rows, we identify that in the attributes item_key, item_code and item_name, item_key is null and providing item code or item_name. These inconsistencies generally happen because of the frequency miss-match between files loaded for sales_fact and item_dim. Whatever the reason, we have the data in the sales_face as shown below, now, we have to get item_name wise purchase quantity on a monthly basis. We may be thinking that we need to join the fact table with the dimension table over item_key, item_code and item_name in three separate queries and union the resultset but it is very inefficient to do so. 

![sales_fact](https://github.com/user-attachments/assets/27a64f74-0339-453b-8e9d-844c22e0e212)
Fig 2: Records in Sales_Fact



