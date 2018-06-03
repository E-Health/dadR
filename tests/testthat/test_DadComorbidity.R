context("Comorbidity")

tmp <- tempfile()

setup({

  # writeLines("TEST DATA", tmp)

})
teardown({

  print( readLines(tmp) )
  unlink(tmp)

})


test_that('return comorbidities', {
  # DADComorbidity returns a data table.
  r_dt <- DADComorbidity("G20")
  expect_known_output(r_dt, tmp, print = TRUE)
})
