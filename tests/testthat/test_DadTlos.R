context("Tlos")

tmp <- tempfile()

setup({

  # writeLines("TEST DATA", tmp)

})
teardown({

  print( readLines(tmp) )
  unlink(tmp)

})


test_that('return mean Tlos', {

  r_dt <- DADTlos("G20")
  expect_known_output(r_dt, tmp, print = TRUE)

})
