## Ingress and egress rules setup
If the project where your billing data is being exported to is within a VPC Service Perimeter, consider following the next steps to set up ingress and egress rules to allow sharing your billing data with the CBS team.

1. Go to **Security** -> **VPC Service Controls**

<img src="https://user-images.githubusercontent.com/100731969/222480319-62790479-8843-4a63-b3fb-5e5223200484.png" width=40% height=40%>

2. Select the corresponding Service Perimeter to **Edit** it.
3. Create the following **ingress** rule:
   * Allow access to the service account: *bigquery-datatransfer@poc-bigquery-dev.iam.gserviceaccount.com*
   * Allow access to your billing data project to the BigQuery API service
   * The **add projects (id or number)** field should be filled out with your project id

<img src="https://user-images.githubusercontent.com/100731969/222481066-0289afba-1aee-4b42-b1b1-62318b1e05ed.png" width=50% height=50%>

4. Create the following **egress** rule:
   * Allow access to the service account : *bigquery-datatransfer@poc-bigquery-dev.iam.gserviceaccount.com*
   * Allow access to the CBS project *364907911525*
   * In **Services**, select select the BigQuery API service

<img src="https://user-images.githubusercontent.com/100731969/222482784-ea443a1f-9ec3-44e2-aa51-170364d95718.png" width=40% height=40%>

5. Click **Save**.
6. Contact the CBS team to validate that they can access the billing data.

### Disclaimer

This is not an officially supported Google product.
