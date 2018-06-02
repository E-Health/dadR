context("Same Treatment")

tmp <- tempfile()

setup({

  # writeLines("TEST DATA", tmp)

})
teardown({

  print( readLines(tmp) )
  unlink(tmp)

})


test_that('returns patients with same treatment', {

  spark_df <- DADSameTreatment("1VA53LAPMN")
  r_df <- collect(spark_df)
  r_dt <- as.data.table(r_df)
  expect_known_output(r_dt, tmp, print = TRUE)
})
