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
    robot.send {room: "#qa"}, "朝チェックをとっとと始めましょう"
  , null, true, "Asia/Tokyo"

  new cron '0 0 13 * * 1-5', () =>
    robot.send {room: "#qa"}, "お昼の時間です。腹八分目で"
  , null, true, "Asia/Tokyo"

  new cron '0 0 13 * * 1-5', () =>
    robot.send {room: "#general"}, "お昼ごはんです。今日は何ラーメン？"
  , null, true, "Asia/Tokyo"

  new cron '0 0 14 * * 1-5', () =>
    robot.send {room: "#qa"}, "午後も元気にバグを見つけましょう。"
  , null, true, "Asia/Tokyo"

  new cron '0 45 18 * * 1-5', () =>
    robot.send {room: "#qa"}, "明日も死ぬ気でバグを見つけましょう"
  , null, true, "Asia/Tokyo"
  
  new cron '0 0 10 * * 1-5', () =>
    robot.send {room: "#general"}, "おはようございます。いつ本気出す？明日でしょ！！今日もユーザーファーストの精神で一日頑張ってください"
  , null, true, "Asia/Tokyo"

  new cron '0 45 18 * * 1-5', () =>
    robot.send {room: "#general"}, "ユーザーのことなんか忘れてゆっくり休みましょう"
  , null, true, "Asia/Tokyo"


