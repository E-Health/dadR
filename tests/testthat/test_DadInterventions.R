context("Interventions")

tmp <- tempfile()

setup({

  # writeLines("TEST DATA", tmp)

})
teardown({

  print( readLines(tmp) )
  unlink(tmp)

})


test_that('return interventions', {
  # DADComorbidity returns a data table.
  r_dt <- DADInterventions("G20")
  expect_known_output(r_dt, tmp, print = TRUE)
})
