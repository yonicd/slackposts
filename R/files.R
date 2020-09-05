#' @title Interact with Files
#' @description Send, list, retrieve information or Delete a file.
#' @param channels character, Channel ID(s) to post file
#' @param file character, file ID
#' @param ... arguments to pass to API method.
#' @param token Character. Your Slack API token. Default: Sys.getenv("SLACK_API_TOKEN")
#' @return A list with an additional class corresponding to \code{slack_method}.
#' @details For a full list of arguments to pass to file methods see [here](https://api.slack.com/methods)
#' @examples
#' \dontrun{
#' tf <- tempfile(fileext = '.r')
#' cat(
#'   utils::capture.output(utils::sessionInfo()),
#'   file = tf,
#'   sep = '\n'
#' )
#'
#' #post the file
#' file_post(
#'   channels = "general",
#'   token = Sys.getenv('SLACK_API_TOKEN'),
#'   file = tf,
#'   filename = 'sessionInfo.R',
#'   filetype = 'r',
#'   title = 'R sessionInfo'
#' )
#'
#' # delete the file
#' file_delete(file_last())
#' }
#' @rdname file_manage
#' @export
#' @importFrom slackcalls files_slack
snippet_post <- function(content, channels, ..., token = Sys.getenv('SLACK_API_TOKEN')){
  slackcalls::files_slack(slack_method = 'files.upload',content = content, channels = channels, ..., token = token)
}

#' @export
#' @rdname file_manage
#' @importFrom slackcalls files_slack
file_post <- function(file, channels, ..., token = Sys.getenv('SLACK_API_TOKEN')){
  slackcalls::files_slack(slack_method = 'files.upload', file = file, channels = channels, ..., token = token)
}

#' @export
#' @rdname file_manage
#' @importFrom slackcalls files_slack
file_delete <- function(file, token = Sys.getenv('SLACK_API_TOKEN')){
  slackcalls::files_slack(slack_method = 'files.delete', file = file, token = token)
}

#' retrieve last post
#'
#' @name file_last
#' @rdname file_last
#' @keywords internal
#' @export
#' @importFrom slackcalls file_last
#' @usage file_last()
NULL

