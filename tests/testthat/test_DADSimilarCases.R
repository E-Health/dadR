context("Same Disease")

tmp <- tempfile()

setup({

  # writeLines("TEST DATA", tmp)

})
teardown({

  print( readLines(tmp) )
  unlink(tmp)

})


test_that('returns patients similar to a given case', {
    spark_df <- DADSimilarCases()
    expect_known_output(spark_df, tmp, print = TRUE)
})
