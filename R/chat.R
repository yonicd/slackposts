#' @title Send/Edit/Delete post from a channel
#' @description Send, Edit or Delete a post from a channel based on the timestamp (ts).
#' @param channel character, Channel ID
#' @param ts character, timestamp
#' @param post slackpost class object that contains meta information to identify a post.
#' @param ... arguments to pass to API method.
#' @param token Character. Your Slack API token. Default: Sys.getenv("SLACK_API_TOKEN")
#' @return A list with an additional class corresponding to \code{slack_method}.
#' @details Arguments that can be passed include 'text', 'blocks'
#' @rdname chat_manage
#' @export
chat_message <- function(channel, ..., token = Sys.getenv('SLACK_API_TOKEN')){

  slackcalls::chat_slack(slack_method = 'chat.postMessage',
                         token = token,
                         channel  = channel,
                         ...,
                         action = 'push')

}

#' @rdname chat_manage
#' @export
chat_update <- function(channel, ts,...,token = Sys.getenv('SLACK_API_TOKEN')){
  UseMethod('chat_update')
}

#' @rdname chat_manage
#' @export
chat_delete <- function(channel, ts,...,token = Sys.getenv('SLACK_API_TOKEN')){
  UseMethod('chat_delete')
}

#' @rdname chat_manage
#' @export
chat_update.default <- function(channel, ts,...,token = Sys.getenv('SLACK_API_TOKEN')){

  slackcalls::chat_slack(slack_method = 'chat.update',
                         token = token,
                         channel = channel,
                         ts = ts,
                         ...,
                         action = c('pop','push')
                        )
}

#' @rdname chat_manage
#' @export
chat_delete.default <- function(channel, ts,...,token = Sys.getenv('SLACK_API_TOKEN')){

  slackcalls::chat_slack(slack_method = 'chat.delete',
                         token = token,
                         channel = channel,
                         ts = ts,
                         ...,
                         action = 'pop')
}

#' @rdname chat_manage
#' @export
chat_update.slackpost <- function(post,...,token = Sys.getenv('SLACK_API_TOKEN')){
  chat_update(channel = post$channel,ts = post$ts,..., token = token)
}

#' @rdname chat_manage
#' @export
chat_delete.slackpost <- function(post,...,token = Sys.getenv('SLACK_API_TOKEN')){
  chat_delete(channel = post$channel,ts = post$ts,..., token = token)
}

#' retrieve last post
#'
#' @name post_last
#' @rdname post_last
#' @keywords internal
#' @export
#' @importFrom slackcalls post_last
#' @usage post_last()
NULL
