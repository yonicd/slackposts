# Environment Variable Must be Defined (Either by Local .Renviron or Environment variable on CI.)
token <- Sys.getenv('SLACK_API_TOKEN')

channel <- "DNRKMTFGD"

testthat::describe("snippet post", {

  res <- snippet_post(channel = channel, token = token, content = 'test')

  it('True result',{
    testthat::expect_true(res$ok)
  })

  it('Validate Content',{
    testthat::expect_equal(res$file$mode,'snippet')
  })

})

testthat::describe("delete snippet", {

  res <- file_delete(file_last())

  it('True result',{
    testthat::expect_true(res$ok)
  })

})

testthat::describe("snippet post", {

  tf <- tempfile(fileext = '.r')

  cat(
    utils::capture.output(utils::sessionInfo()),
    file = tf,
    sep = '\n'
  )

  #post the file
  res <- file_post(
    channels = channel,
    token = token,
    file = tf,
    filename = 'sessionInfo.R',
    filetype = 'r',
    title = 'R sessionInfo'
  )

  it('True result',{
    testthat::expect_true(res$ok)
  })

  it('Validate title',{
    testthat::expect_equal(res$file$title,'R sessionInfo')
  })

})

testthat::describe("delete file", {

  res <- file_delete(file_last())

  it('True result',{
    testthat::expect_true(res$ok)
  })

})
