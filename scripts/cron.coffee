# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md
cron = require('cron').CronJob

module.exports = (robot) ->
  new cron '0 0 10 * * 1-5', () =>
    robot.send {room: "#qa"}, "今日も陽気にバグを見つけましょう"
  , null, true, "Asia/Tokyo"

    new cron '0 1 10 * * 1-5', () =>
    robot.send {room: "#qa"}, "朝チェックで呑気にバグを見つけましょう"
  , null, true, "Asia/Tokyo"
