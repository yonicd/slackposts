Tests and Coverage
================
27 February, 2023 18:47:27

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                    | Coverage (%) |
| :------------------------ | :----------: |
| slackposts                |     100      |
| [R/chat.R](../R/chat.R)   |     100      |
| [R/files.R](../R/files.R) |     100      |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file                                |  n |   time | error | failed | skipped | warning |
| :---------------------------------- | -: | -----: | ----: | -----: | ------: | ------: |
| [test-chat.R](testthat/test-chat.R) | 61 | 33.126 |     0 |      0 |       0 |       0 |
| [test-file.R](testthat/test-file.R) | 10 |  3.307 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results </summary>

| file                                          | context | test                                                          | status |  n |   time |
| :-------------------------------------------- | :------ | :------------------------------------------------------------ | :----- | -: | -----: |
| [test-chat.R](testthat/test-chat.R#L59_L67)   | chat    | Can delete any existing content                               | PASS   | 24 | 27.509 |
| [test-chat.R](testthat/test-chat.R#L121_L129) | chat    | Can post a message                                            | PASS   |  3 |  0.272 |
| [test-chat.R](testthat/test-chat.R#L137_L146) | chat    | Can update that message                                       | PASS   |  6 |  0.378 |
| [test-chat.R](testthat/test-chat.R#L165_L173) | chat    | Can delete that post                                          | PASS   |  5 |  0.626 |
| [test-chat.R](testthat/test-chat.R#L201_L209) | chat    | Can post messages to restore the channel to its desired state | PASS   | 20 |  4.094 |
| [test-chat.R](testthat/test-chat.R#L215_L224) | chat    | Can reply to a message                                        | PASS   |  3 |  0.247 |
| [test-file.R](testthat/test-file.R#L54_L62)   | file    | Can post snippets                                             | PASS   |  4 |  1.315 |
| [test-file.R](testthat/test-file.R#L73_L78)   | file    | Can delete snippets                                           | PASS   |  2 |  0.325 |
| [test-file.R](testthat/test-file.R#L98_L109)  | file    | Can post files                                                | PASS   |  3 |  1.376 |
| [test-file.R](testthat/test-file.R#L125)      | file    | Can delete files                                              | PASS   |  1 |  0.291 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                         |                                                                                                                                                                                                                                                                    |
| :------- | :---------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Version  | R version 4.2.2 (2022-10-31)  |                                                                                                                                                                                                                                                                    |
| Platform | x86\_64-pc-linux-gnu (64-bit) | <a href="https://github.com/yonicd/slackposts/commit/1ca53e725f7c187891d69dacf054d2e3f15b5d5a/checks" target="_blank"><span title="Built on Github Actions">![](https://github.com/metrumresearchgroup/covrpage/blob/actions/inst/logo/gh.png?raw=true)</span></a> |
| Running  | Ubuntu 22.04.2 LTS            |                                                                                                                                                                                                                                                                    |
| Language | C                             |                                                                                                                                                                                                                                                                    |
| Timezone | UTC                           |                                                                                                                                                                                                                                                                    |

| Package  | Version |
| :------- | :------ |
| testthat | 3.1.6   |
| covr     | 3.6.1   |
| covrpage | 0.2     |

</details>

<!--- Final Status : pass --->
