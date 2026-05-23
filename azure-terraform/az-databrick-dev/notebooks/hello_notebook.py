# Databricks notebook created via Terraform
print("Hello Surya — your Databricks cluster is working!")

df = spark.range(10)
df.show()