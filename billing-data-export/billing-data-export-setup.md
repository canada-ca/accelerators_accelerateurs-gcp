## Billing Data Export Setup
This documentation describes the steps to enable billing data export for your assigned Billing Account.

### Note:
Make sure you have completed the following prerequisites:
* Create a new project for cloud billing data purposes before proceeding with the next steps. Make sure that this project is linked to the Billing Account you will set up billing export for.
* Enable the BigQuery Data Transfer Service API

1. Click on the left hand hamburger menu and click on **Billing**.

![image](https://user-images.githubusercontent.com/100731969/222251566-47e0458e-5796-4fc4-85ff-291c9088557a.png)

2. Click onn **MANAGE BILLING ACCOUNTS**.

![image](https://user-images.githubusercontent.com/100731969/222252516-116b9320-6c33-4746-9742-dca59492f301.png)

3. Select the corresponding billing account. Make sure that the Billing account ID corresponds to the one provided to you by the Cloud Broker Service.

4. Ensure that you selected the correct billing account by verifying the ‘account number’ under billing account on the top left side. Click **Billing export** on the left hand navigation menu.

![4h8wcxrMstHXUFP_image-bytes](https://user-images.githubusercontent.com/100731969/222263715-d49d2e4e-4584-467b-a26d-10e7ec6d8244.png)

5. Under **Standard usage cost**, click on the **EDIT SETTINGS** button.

![BRevyen4EuTmXq4_image-bytes](https://user-images.githubusercontent.com/100731969/222263842-792b689d-3e89-43c2-bd18-0c2cae0ce796.png)

6. In the **projects** dropdown, select the project created for billing data purposes. In the **Dataset** dropdown, select **Create a new dataset**.

![9XuFakPY3ukRWyP_image-bytes](https://user-images.githubusercontent.com/100731969/222263904-7f8d6897-bdf5-442b-aa22-a88b7bc635e7.png)

7. When creating the new dataset, note the following:
* Set **Location type** to **Region** and select northamerica-northeast1 or northamerica-northeast2.
* Make sure you select **Enable table expiration** checkbox and set it to 90 days. This is to optimize storage and cost.

![7bTZuUN9SbZUCcT_image-bytes](https://user-images.githubusercontent.com/100731969/222264803-95307439-fb98-4570-8369-280f7b224e78.png)

