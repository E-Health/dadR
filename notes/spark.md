 
## Install sparkR from https://cran.r-project.org/src/contrib/Archive/SparkR/

## Detailed Instructions: https://spark.apache.org/docs/latest/sparkr.html

## Spark commands

sc <- sparkR.session(master = "", sparkConfig = list(spark.driver.memory = "2g"))
df <- as.DataFrame(faithful)

# You can also pass in column name as strings
head(select(df, "eruptions"))
head(select(df, df$eruptions))
head(filter(df, df$waiting < 50))

head(summarize(groupBy(df, df$waiting), count = n(df$waiting)))

# We can also sort the output from the aggregation to get the most common waiting times
waiting_counts <- summarize(groupBy(df, df$waiting), count = n(df$waiting))
head(arrange(waiting_counts, desc(waiting_counts$count)))

* OLAP cube
  head(agg(cube(df, "cyl", "disp", "gear"), avg(df$mpg)))
  head(agg(rollup(df, "cyl", "disp", "gear"), avg(df$mpg)))

