context("Same Disease")

tmp <- tempfile()

setup({

  # writeLines("TEST DATA", tmp)

})
teardown({

  print( readLines(tmp) )
  unlink(tmp)

})


test_that('returns patients with same disease', {

  spark_df <- DADSameDisease("G2")
  r_df <- collect(spark_df)
  r_dt <- as.data.table(r_df)
  expect_known_output(r_dt, tmp, print = TRUE)
})
