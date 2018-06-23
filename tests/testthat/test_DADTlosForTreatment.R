context("DADTlosForTreatment")

tmp <- tempfile()

setup({

  # writeLines("TEST DATA", tmp)

})
teardown({

  print( readLines(tmp) )
  unlink(tmp)

})


test_that('return mean DADTlosForTreatment', {

  r_dt <- DADTlosForTreatment("1VA53LAPMN")
  expect_known_output(r_dt, tmp, print = TRUE)

})
