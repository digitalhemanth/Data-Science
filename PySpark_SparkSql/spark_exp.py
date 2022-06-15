# Create SparkSession from builder
import findspark
findspark.init()

import pyspark
from pyspark.sql import SparkSession
spark = SparkSession.builder.master("local") \
                    .appName('MyApp') \
                    .getOrCreate()
                    
print(spark)