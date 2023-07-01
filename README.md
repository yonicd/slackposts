
<!-- README.md is generated from README.Rmd. Please edit that file -->

# slackposts

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Covrpage
Summary](https://img.shields.io/badge/covrpage-Last_Build_2023_07_01-brightgreen.svg)](https://tinyurl.com/2lxgjyzn)
[![R-CMD-check](https://github.com/yonicd/slackposts/actions/workflows/r-cmd-check.yml/badge.svg)](https://github.com/yonicd/slackposts/actions/workflows/r-cmd-check.yml)
[![Codecov test
coverage](https://codecov.io/gh/yonicd/slackposts/branch/master/graph/badge.svg)](https://codecov.io/gh/yonicd/slackposts?branch=master)
<!-- badges: end -->

`slackposts` is a part of `slackverse`

|                                                                                                                                                   |                                                                                                                                             |                                                                                                                                                |
| :-----------------------------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------------------------------------------: |
|                                                                                                                                                   | slackcalls<br>[![](https://github.com/yonicd/slackcalls/actions/workflows/r-cmd-check.yml/badge.svg)](https://github.com/yonicd/slackcalls) |                                                                                                                                                |
| slackthreads<br>[![](https://github.com/yonicd/slackthreads/actions/workflows/r-cmd-check.yml/badge.svg)](https://github.com/yonicd/slackthreads) | slackteams<br>[![](https://github.com/yonicd/slackteams/actions/workflows/r-cmd-check.yml/badge.svg)](https://github.com/yonicd/slackteams) |  slackposts<br>[![](https://github.com/yonicd/slackposts/actions/workflows/r-cmd-check.yml/badge.svg)](https://github.com/yonicd/slackposts)   |
|                                                                                                                                                   |                                                                                                                                             | slackblocks<br>[![](https://github.com/yonicd/slackblocks/actions/workflows/r-cmd-check.yml/badge.svg)](https://github.com/yonicd/slackblocks) |
|                                                                                                                                                   |                                                                                                                                             | slackreprex<br>[![](https://github.com/yonicd/slackreprex/actions/workflows/r-cmd-check.yml/badge.svg)](https://github.com/yonicd/slackreprex) |

`slackposts` is an `R` package that allows the user to interact with
slack API chat messages, snippets and files from R.

## Installation

``` r
remotes::install_github("yonicd/slackposts")
```

## Usage

### Token

First you need a Slack API Token, to learn how to create one go to
[slackteams](https://github.com/yonicd/slackteams) or set it directly as
the environment variable `Sys.setenv('SLACK_API_TOKEN')`.

### Load

``` r
library(slackposts)
```

### Chats

#### Post a message

``` r
chat_post(
  channels = "general",
  text = 'my message'
  )
```

#### Update a message

``` r
chat_update(
  post = slackposts::post_last(),
  text = 'my updated message'
  )
```

#### Delete Message

``` r
chat_delete(
  post = slackposts::post_last()
  )
```

### Files

#### Create a temp file

``` r
tf <- tempfile(fileext = '.r')
cat(
  utils::capture.output(utils::sessionInfo()),
  file = tf,
  sep = '\n'
)
```

#### Post the file

``` r

file_post(
  channels = "general",
  file = tf,
  filename = 'sessionInfo.R',
  filetype = 'r',
  title = 'R sessionInfo'
)
```

# Delete the file

``` r
file_delete(file_last())
```
