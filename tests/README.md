Tests and Coverage
================
01 January, 2024 13:15:19

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
| [test-chat.R](testthat/test-chat.R) | 61 | 28.423 |     0 |      0 |       0 |       0 |
| [test-file.R](testthat/test-file.R) | 10 |  2.965 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results </summary>

| file                                          | context | test                                                          | status |  n |   time |
| :-------------------------------------------- | :------ | :------------------------------------------------------------ | :----- | -: | -----: |
| [test-chat.R](testthat/test-chat.R#L59_L67)   | chat    | Can delete any existing content                               | PASS   | 24 | 25.541 |
| [test-chat.R](testthat/test-chat.R#L121_L129) | chat    | Can post a message                                            | PASS   |  3 |  0.091 |
| [test-chat.R](testthat/test-chat.R#L137_L146) | chat    | Can update that message                                       | PASS   |  6 |  0.257 |
| [test-chat.R](testthat/test-chat.R#L165_L173) | chat    | Can delete that post                                          | PASS   |  5 |  0.401 |
| [test-chat.R](testthat/test-chat.R#L201_L209) | chat    | Can post messages to restore the channel to its desired state | PASS   | 20 |  1.990 |
| [test-chat.R](testthat/test-chat.R#L215_L224) | chat    | Can reply to a message                                        | PASS   |  3 |  0.143 |
| [test-file.R](testthat/test-file.R#L54_L62)   | file    | Can post snippets                                             | PASS   |  4 |  1.215 |
| [test-file.R](testthat/test-file.R#L73_L78)   | file    | Can delete snippets                                           | PASS   |  2 |  0.211 |
| [test-file.R](testthat/test-file.R#L98_L109)  | file    | Can post files                                                | PASS   |  3 |  1.258 |
| [test-file.R](testthat/test-file.R#L125)      | file    | Can delete files                                              | PASS   |  1 |  0.281 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                         |                                                                                                                                                                                                                                                                    |
| :------- | :---------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Version  | R version 4.3.2 (2023-10-31)  |                                                                                                                                                                                                                                                                    |
| Platform | x86\_64-pc-linux-gnu (64-bit) | <a href="https://github.com/yonicd/slackposts/commit/a821f8fd55639b5cc0ede51a1f4524a20f7ba1d3/checks" target="_blank"><span title="Built on Github Actions">![](https://github.com/metrumresearchgroup/covrpage/blob/actions/inst/logo/gh.png?raw=true)</span></a> |
| Running  | Ubuntu 22.04.3 LTS            |                                                                                                                                                                                                                                                                    |
| Language | C                             |                                                                                                                                                                                                                                                                    |
| Timezone | UTC                           |                                                                                                                                                                                                                                                                    |

| Package  | Version |
| :------- | :------ |
| testthat | 3.2.1   |
| covr     | 3.6.4   |
| covrpage | 0.2     |

</details>

<!--- Final Status : pass --->
