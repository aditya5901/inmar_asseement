#############################################
################# Part - A ##################
#############################################
from pyspark.sql import SparkSession
from pyspark.sql.functions import avg

spark = SparkSession.builder.appName("Transactions").getOrCreate()
transactions_df = spark.read.csv("path/to/input/file.csv", header=True, inferSchema=True)
average_transaction_amount = transactions_df.agg(avg("TransactionAmount")).collect()[0][0]
print(average_transaction_amount)

#############################################
################# Part - B ##################
#############################################
'''
We can create a bigquery table pointing out to the GCS location ###
CREATE EXTERNAL TABLE `your_project.your_dataset.your_table`
OPTIONS (
  format = 'CSV',
  uris = ['gs://your_bucket_name/your_file.csv'],
  skip_leading_rows = 1,
  schema = 'Date STRING, Description STRING, TransactionAmount FLOAT64'
);
'''