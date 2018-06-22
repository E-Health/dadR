context("Cointerventions")

tmp <- tempfile()

setup({

  # writeLines("TEST DATA", tmp)

})
teardown({

  print( readLines(tmp) )
  unlink(tmp)

})


test_that('return cointerventions', {
  # DADComorbidity returns a data table.
  r_dt <- DADCointerventions("1VA53LAPMN")
  expect_known_output(r_dt, tmp, print = TRUE)
})
