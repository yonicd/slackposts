Tests and Coverage
================
01 May, 2023 13:14:34

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
| [test-chat.R](testthat/test-chat.R) | 61 | 29.031 |     0 |      0 |       0 |       0 |
| [test-file.R](testthat/test-file.R) | 10 |  2.881 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results </summary>

| file                                          | context | test                                                          | status |  n |   time |
| :-------------------------------------------- | :------ | :------------------------------------------------------------ | :----- | -: | -----: |
| [test-chat.R](testthat/test-chat.R#L59_L67)   | chat    | Can delete any existing content                               | PASS   | 24 | 25.224 |
| [test-chat.R](testthat/test-chat.R#L121_L129) | chat    | Can post a message                                            | PASS   |  3 |  0.160 |
| [test-chat.R](testthat/test-chat.R#L137_L146) | chat    | Can update that message                                       | PASS   |  6 |  0.192 |
| [test-chat.R](testthat/test-chat.R#L165_L173) | chat    | Can delete that post                                          | PASS   |  5 |  0.588 |
| [test-chat.R](testthat/test-chat.R#L201_L209) | chat    | Can post messages to restore the channel to its desired state | PASS   | 20 |  2.719 |
| [test-chat.R](testthat/test-chat.R#L215_L224) | chat    | Can reply to a message                                        | PASS   |  3 |  0.148 |
| [test-file.R](testthat/test-file.R#L54_L62)   | file    | Can post snippets                                             | PASS   |  4 |  1.239 |
| [test-file.R](testthat/test-file.R#L73_L78)   | file    | Can delete snippets                                           | PASS   |  2 |  0.197 |
| [test-file.R](testthat/test-file.R#L98_L109)  | file    | Can post files                                                | PASS   |  3 |  1.238 |
| [test-file.R](testthat/test-file.R#L125)      | file    | Can delete files                                              | PASS   |  1 |  0.207 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                         |                                                                                                                                                                                                                                                                    |
| :------- | :---------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Version  | R version 4.3.0 (2023-04-21)  |                                                                                                                                                                                                                                                                    |
| Platform | x86\_64-pc-linux-gnu (64-bit) | <a href="https://github.com/yonicd/slackposts/commit/b95c669a2506ede5b470cf9cd8eac13d38b21d45/checks" target="_blank"><span title="Built on Github Actions">![](https://github.com/metrumresearchgroup/covrpage/blob/actions/inst/logo/gh.png?raw=true)</span></a> |
| Running  | Ubuntu 22.04.2 LTS            |                                                                                                                                                                                                                                                                    |
| Language | C                             |                                                                                                                                                                                                                                                                    |
| Timezone | UTC                           |                                                                                                                                                                                                                                                                    |

| Package  | Version |
| :------- | :------ |
| testthat | 3.1.7   |
| covr     | 3.6.2   |
| covrpage | 0.2     |

</details>

<!--- Final Status : pass --->
