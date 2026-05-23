# Simple Spark job to validate cluster + notebook + repo

from pyspark.sql import functions as F

# Create a small DataFrame
df = spark.createDataFrame(
    [
        (1, "Gayatri", 100),
        (2, "Surya", 200),
        (3, "Naveen", 300)
    ],
    ["id", "name", "value"]
)

print("Input DataFrame:")
df.show()

# Add a new column
df2 = df.withColumn("value_x2", F.col("value") * 2)

print("Transformed DataFrame:")
df2.show()

# Aggregate
agg = df2.groupBy().agg(
    F.sum("value").alias("total_value"),
    F.sum("value_x2").alias("total_value_x2")
)

print("Aggregated Results:")
agg.show()
