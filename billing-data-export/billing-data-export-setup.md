## GCP Billing Data Export Setup
This documentation describes the steps to enable billing data export for your assigned Billing Account.
***
### Note:
Make sure you have completed the following prerequisites before proceeding with the setup:
* Create a new project for cloud billing data purposes before proceeding with the next steps. Make sure that this project is linked to the Billing Account you will set up billing export for.
* Enable the BigQuery Data Transfer Service API
***

1. Go to the left hand hamburger menu and click on **Billing**.

<img src="https://user-images.githubusercontent.com/100731969/222251566-47e0458e-5796-4fc4-85ff-291c9088557a.png" width=80% height=80%>

2. Click on **MANAGE BILLING ACCOUNTS**.

<img src="https://user-images.githubusercontent.com/100731969/222252516-116b9320-6c33-4746-9742-dca59492f301.png" width=80% height=80%>

3. Select the corresponding billing account. Make sure that the *Billing Account ID* corresponds to the one provided to you by the Cloud Broker Service.
   Ensure that you have selected the correct billing account by verifying the *account number* under **Billing account** on the top left side. 

<img src="https://user-images.githubusercontent.com/100731969/222476310-0ceb6870-b42f-499b-b4f7-bc5f8ac2334c.png" width=80% height=80%>

4. Click **Billing export** on the left hand navigation menu.
   Under **Standard usage cost**, click on the **EDIT SETTINGS** button.

<img src="https://user-images.githubusercontent.com/100731969/222263842-792b689d-3e89-43c2-bd18-0c2cae0ce796.png" width=80% height=80%>

5. In the **Projects** dropdown, select the project created for billing data purposes. 
   In the **Dataset** dropdown, select **Create a new dataset**.

<img src="https://user-images.githubusercontent.com/100731969/222263904-7f8d6897-bdf5-442b-aa22-a88b7bc635e7.png" width=80% height=80%>

6. When creating the new dataset, note the following:
   * Set **Location type** to **Region** and select *northamerica-northeast1* or *northamerica-northeast2*.
   * Make sure you select **Enable table expiration** checkbox and set it to **90 days**. This is to optimize storage and cost.

<img src="https://user-images.githubusercontent.com/100731969/222264803-95307439-fb98-4570-8369-280f7b224e78.png" width=40% height=40%>

7. Click **Create dataset**.
8. Click **Save** to finalize the billing export setup.
9. Finally, share the *dataset* name and the *project id* with the CBS team at SSC.


### Disclaimer

This is not an officially supported Google product.
