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

test_that("Can delete any existing content", {
  # The strategy here (for the live tests) is somewhat opposite of the usual
  # "leave things unchanged" philosophy. This package will clear out the
  # #slack-r channel on the test Slack, and then repopulate it.

  # We'll still do formal delete tests separately, since it's possible there
  # won't be anything for this step to delete.
  expect_error(
    with_mock_api({
      existing <- slackcalls::post_slack(
        slack_method = "conversations.history",
        channel = slack_test_channel
      )
    }),
    NA
  )

  if (length(existing$messages)) {
    for (msg in existing$messages) {
      if (length(msg$ts)) {
        # First delete any replies.
        if (length(msg$thread_ts)) {
          expect_error(
            with_mock_api({
              replies <- slackcalls::post_slack(
                slack_method = 'conversations.replies',
                ts = msg$ts,
                channel = slack_test_channel
              )
            }),
            NA
          )
          if (length(replies$messages)) {
            for (reply in replies$messages) {
              expect_error(
                with_mock_api({
                  chat_delete(
                    channel = slack_test_channel,
                    ts = reply$ts
                  )
                }),
                NA
              )
            }
          }
        }

        # Then we can clear out the associated message.
        expect_error(
          with_mock_api({
            chat_delete(
              channel = slack_test_channel,
              ts = msg$ts
            )
          }),
          NA
        )
      }
    }
  }


})

test_that("Can post a message", {
  expect_error(
    with_mock_api({
      res <- chat_message(
        channel = slack_test_channel,
        text = "test"
      )
    }),
    NA
  )

  expect_true(res$ok)
  expect_identical(res$message$text, "test")
})

test_that("Can update that message", {
  new_msg <- post_last()
  expect_error(
    with_mock_api({
      res <- chat_update(
        channel = new_msg$channel,
        ts = new_msg$ts,
        text = "test text update"
      )
    }),
    NA
  )
  expect_true(res$ok)
  expect_identical(res$message$text, "test text update")

  expect_error(
    with_mock_api({
      res <- chat_update(
        post = new_msg,
        text = "test object update"
      )
    }),
    NA
  )
  expect_true(res$ok)
  expect_identical(res$message$text, "test object update")
})

test_that("Can delete that post", {
  new_msg <- post_last()
  expect_error(
    with_mock_api({
      res <- chat_delete(
        channel = new_msg$channel,
        ts = new_msg$ts
      )
    }),
    NA
  )
  expect_true(res$ok)

  # And a new one as an object.
  expect_error(
    with_mock_api({
      chat_message(
        channel = slack_test_channel,
        text = "delete me"
      )
    }),
    NA
  )

  expect_error(
    with_mock_api({
      res <- chat_delete(
        post = post_last()
      )
    }),
    NA
  )
  expect_true(res$ok)
})

test_that("Can post messages to restore the channel to its desired state", {
  # Post messages with content "1" through "20".
  for (i in 1:20) {
    expect_error(
      with_mock_api({
        chat_message(
          channel = slack_test_channel,
          text = i
        )
      }),
      NA
    )
  }
})

test_that("Can reply to a message", {
  # Also post a reply to 20.
  expect_error(
    with_mock_api({
      res <- chat_message(
        channel = slack_test_channel,
        thread_ts = post_last()$ts,
        text = "this is a reply"
      )
    }),
    NA
  )
  expect_true(res$ok)
  expect_identical(res$message$text, "this is a reply")
})
