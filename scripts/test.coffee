# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

module.exports = (robot) ->

ans = ['グー', 'チョキi', 'パー']

module.exports = (robot) ->
  robot.respond /janken/i, (msg) ->
    msg.reply msg.random ans


  robot.hear  /アカウント/i, (msg) ->
    msg.reply "ID: cv_operation_group@carview.co.jp　PASS:6165!appleCV"

  robot.hear  /神/i, (msg) ->
    msg.reply "綱様"
