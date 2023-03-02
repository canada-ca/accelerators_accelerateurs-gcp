## Billing Data Export Setup
This documentation describes the steps to enable billing data export for your assigned Billing Account.
***
### Note:
Make sure you have completed the following prerequisites before proceeding with the setup:
* Create a new project for cloud billing data purposes before proceeding with the next steps. Make sure that this project is linked to the Billing Account you will set up billing export for.
* Enable the BigQuery Data Transfer Service API
***

1. Go to the left hand hamburger menu and click on **Billing**.

<img src="https://user-images.githubusercontent.com/100731969/222251566-47e0458e-5796-4fc4-85ff-291c9088557a.png" width=70% height=70%>

2. Click on **MANAGE BILLING ACCOUNTS**.

<img src="https://user-images.githubusercontent.com/100731969/222252516-116b9320-6c33-4746-9742-dca59492f301.png" width=70% height=70%>

3. Select the corresponding billing account. Make sure that the *Billing Account ID* corresponds to the one provided to you by the Cloud Broker Service.
   Ensure that you selected the correct billing account by verifying the *account number* under **Billing account** on the top left side. 

<img src="https://user-images.githubusercontent.com/100731969/222475081-1604461e-a825-4b90-b9a4-75f91c3978c1.png" width=70% height=70%>

4. Click **Billing export** on the left hand navigation menu.
   Under **Standard usage cost**, click on the **EDIT SETTINGS** button.

<img src="https://user-images.githubusercontent.com/100731969/222263842-792b689d-3e89-43c2-bd18-0c2cae0ce796.png" width=70% height=70%>

6. In the **Projects** dropdown, select the project created for billing data purposes. 
   In the **Dataset** dropdown, select **Create a new dataset**.

<img src="https://user-images.githubusercontent.com/100731969/222263904-7f8d6897-bdf5-442b-aa22-a88b7bc635e7.png" width=70% height=70%>

7. When creating the new dataset, note the following:
   * Set **Location type** to **Region** and select northamerica-northeast1 or northamerica-northeast2.
   * Make sure you select **Enable table expiration** checkbox and set it to 90 days. This is to optimize storage and cost.

<img src="https://user-images.githubusercontent.com/100731969/222264803-95307439-fb98-4570-8369-280f7b224e78.png" width=70% height=70%>

