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

  new cron '0 00 19 * * 1-5', () =>
    robot.send {room: "#general"}, "明日もユーザーファーストの精神で頑張りましょう"
  , null, true, "Asia/Tokyo"

  new cron '0 40 18 * * *', () =>
    robot.send {room: "#general"}, "本日の工数入力は忘れていませんか？"
  , null, true, "Asia/Tokyo"
  
   new cron '0 0 12 14 2 *', () =>
    robot.send {room: "#general"}, "増子さん三富さん誕生日おめでとうございます"
  , null, true, "Asia/Tokyo"
