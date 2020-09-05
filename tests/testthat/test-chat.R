# Environment Variable Must be Defined (Either by Local .Renviron or Environment variable on CI.)
token <- Sys.getenv('SLACK_API_TOKEN')

channel <- "DNRKMTFGD"

testthat::describe("chat post", {

  res <- chat_message(channel = channel, token = token, text = 'test')

  it('True result',{
    testthat::expect_true(res$ok)
  })

  it('Validate Content',{
    testthat::expect_equal(res$message$text,'test')
  })

})

testthat::describe("chat update", {

  lp <- post_last()

  res <- chat_update(channel = lp$channel, ts = lp$ts, token = token, text = 'test direct')

  it('True result manual',{
    testthat::expect_true(res$ok)
  })

  it('Validate Content manual',{
    testthat::expect_equal(res$message$text,'test direct')
  })

  res <- chat_update(post = lp, token = token, text = 'test object')

  it('True result slackpost object',{
    testthat::expect_true(res$ok)
  })

  it('Validate Content  slackpost object',{
    testthat::expect_equal(res$message$text,'test object')
  })

})

testthat::describe("chat delete", {

  lp <- post_last()

  res <- chat_delete(channel = lp$channel, ts = lp$ts, token = token, text = 'test direct')

  it('True result manual',{
    testthat::expect_true(res$ok)
  })

  chat_message(channel = channel, token = token, text = 'test')

  res <- chat_delete(post = post_last(), token = token, text = 'test direct')

  it('True result slackpost object',{
    testthat::expect_true(res$ok)
  })

})
