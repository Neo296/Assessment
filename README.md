I have created seperate dimensions and fact tables and joined them using star schema.
First I tried directly without any data transformations/cleaning but then I found null and duplicates in customer table.
I had to then recreate my fact and dimensions with correct data.
I have also created a view after all the tables were created to be used in looker
There is a connection issue with postgre in looker getting error ID : f839d4a6
I could successfully connect it in power bi and perform my analysis , I have added the screenshots for reference
Key insights and any other metrics are done using sql and the results are added in a seperate text file
