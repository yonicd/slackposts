# Set up tests. ---------------------------------------------------------------
# While this *could* go into a setup.R file, that makes interactive testing
# annoying. I compromised and put it in a collapsible block at the top of each
# test file.

# To test the API:

# Sys.setenv(SLACK_API_TEST_MODE = "true")

# To capture test data:

# Sys.setenv(SLACK_API_TEST_MODE = "capture")

# To go back to a "normal" mode:

# Sys.unsetenv("SLACK_API_TEST_MODE")

slack_api_test_mode <- Sys.getenv("SLACK_API_TEST_MODE")
withr::defer(rm(slack_api_test_mode))

library(httptest)

# All tests use #slack-r on slackr-test (or a mocked version of it).
slack_test_channel <- "CNTFB9215"
withr::defer(rm(slack_test_channel))

if (slack_api_test_mode == "true" || slack_api_test_mode == "capture") {
  # In these modes we need a real API token. If one isn't set, this should throw
  # an error right away.
  if (Sys.getenv("SLACK_API_TOKEN") == "") {
    stop(
      "No SLACK_API_TOKEN available, cannot test. \n",
      "Unset SLACK_API_TEST_MODE to use mock.")
  }

  if (slack_api_test_mode == "true") {
    # Override the main mock function from httptest, so we use the real API.
    with_mock_api <- force
  } else {
    # This tricks httptest into capturing results instead of actually testing.
    with_mock_api <- httptest::capture_requests
  }
  withr::defer(rm(with_mock_api))
}


# Tests. -----------------------------------------------------------------------

test_that("Can post snippets", {
  expect_error(
    with_mock_api({
      res <- snippet_post(
        channel = slack_test_channel,
        content = "test"
      )
    }),
    NA
  )

  expect_true(res$ok)
  expect_identical(res$file$mode, "snippet")
  expect_identical(res$file$preview, "test")
})

test_that("Can delete snippets", {
  expect_error(
    with_mock_api({
      res <- file_delete(file_last())
    }),
    NA
  )

  expect_true(res$ok)
})

test_that("Can post files", {
  # I can't get this to work with a recorded call, since the thing being
  # uploaded changes slightly; a temp file or something similar is created by
  # curl, so, even if I use a non-relative/non-random path, it fails. Therefore
  # let's only test this when we're really hitting the API.
  skip_if_not(
    slack_api_test_mode == "true",
    "Only test tempfile uploads against real API."
  )

  tf <- withr::local_tempfile(
    fileext = ".R"
  )

  cat(
    utils::capture.output(utils::sessionInfo()),
    file = tf,
    sep = '\n'
  )

  expect_error(
    {
      res <- file_post(
        channels = slack_test_channel,
        file = tf,
        filename = "sessionInfo.R",
        filetype = "r",
        title = "R sessionInfo"
      )
    },
    NA
  )

  expect_true(res$ok)
  expect_equal(res$file$title, "R sessionInfo")
})

test_that("Can delete files", {
  skip_if_not(
    slack_api_test_mode == "true",
    "Only test tempfile deletes against real API."
  )

  res <- file_delete(file_last())
  expect_true(res$ok)
})
