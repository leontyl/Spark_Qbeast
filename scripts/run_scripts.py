from pyspark.sql import SparkSession

# Step 1: Initialize Spark session
spark = SparkSession.builder \
    .appName("Simple Spark Job") \
    .master("spark://spark-master:7077") \
    .getOrCreate()

# Step 2: Read input data from the JSON file into a DataFrame
input_data = spark.read.json("/opt/spark/data/input_data.json")

# Step 3: Perform a simple transformation on the data (optional)
# For example, just select the fields to test
output_data = input_data.select("*")

# Step 4: Show the first few records to verify the data is loaded correctly
output_data.show()

# Step 5: Save the transformed result back to a file
output_data.coalesce(1).write.json("/opt/spark/data/output_data.json")

# Step 6: Stop the Spark session
spark.stop()
