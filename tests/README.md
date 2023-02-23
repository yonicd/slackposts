Tests and Coverage
================
23 February, 2023 15:17:24

- <a href="#coverage" id="toc-coverage">Coverage</a>
- <a href="#unit-tests" id="toc-unit-tests">Unit Tests</a>

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                    | Coverage (%) |
|:--------------------------|:------------:|
| slackposts                |     100      |
| [R/chat.R](../R/chat.R)   |     100      |
| [R/files.R](../R/files.R) |     100      |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file                                |   n |  time | error | failed | skipped | warning |
|:------------------------------------|----:|------:|------:|-------:|--------:|--------:|
| [test-chat.R](testthat/test-chat.R) |  61 | 31.94 |     0 |      0 |       0 |       0 |
| [test-file.R](testthat/test-file.R) |  10 |  3.14 |     0 |      0 |       0 |       0 |

<details closed>
<summary>
Show Detailed Test Results
</summary>

| file                                          | context | test                                                          | status |   n |  time |
|:----------------------------------------------|:--------|:--------------------------------------------------------------|:-------|----:|------:|
| [test-chat.R](testthat/test-chat.R#L56_L64)   | chat    | Can delete any existing content                               | PASS   |  24 | 27.24 |
| [test-chat.R](testthat/test-chat.R#L118_L126) | chat    | Can post a message                                            | PASS   |   3 |  0.42 |
| [test-chat.R](testthat/test-chat.R#L134_L143) | chat    | Can update that message                                       | PASS   |   6 |  0.41 |
| [test-chat.R](testthat/test-chat.R#L162_L170) | chat    | Can delete that post                                          | PASS   |   5 |  0.61 |
| [test-chat.R](testthat/test-chat.R#L198_L206) | chat    | Can post messages to restore the channel to its desired state | PASS   |  20 |  3.04 |
| [test-chat.R](testthat/test-chat.R#L212_L221) | chat    | Can reply to a message                                        | PASS   |   3 |  0.22 |
| [test-file.R](testthat/test-file.R#L50_L58)   | file    | Can post snippets                                             | PASS   |   4 |  1.33 |
| [test-file.R](testthat/test-file.R#L69_L74)   | file    | Can delete snippets                                           | PASS   |   2 |  0.23 |
| [test-file.R](testthat/test-file.R#L94_L105)  | file    | Can post files                                                | PASS   |   3 |  1.34 |
| [test-file.R](testthat/test-file.R#L121)      | file    | Can delete files                                              | PASS   |   1 |  0.24 |

</details>
<details>
<summary>
Session Info
</summary>

| Field    | Value                             |
|:---------|:----------------------------------|
| Version  | R version 4.2.2 (2022-10-31 ucrt) |
| Platform | x86_64-w64-mingw32/x64 (64-bit)   |
| Running  | Windows 10 x64 (build 22621)      |
| Language | English_United States             |
| Timezone | America/Chicago                   |

| Package  | Version |
|:---------|:--------|
| testthat | 3.1.6   |
| covr     | 3.6.1   |
| covrpage | 0.2     |

</details>
<!--- Final Status : pass --->
