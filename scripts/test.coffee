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

ram = ['たまにはラーメン以外も食べましょう','味噌ラーメンがオススメ', '豚骨ラーメンがオススメ', '塩ラーメンがオススメ', '醤油ラーメンがオススメ', '社畜カップ麺がオススメ', '天下一品こってりラーメンがオススメ', 'お前なんかチキンラーメンの丼齧ってろ']

module.exports = (robot) ->
  robot.hear /ラーメン/i, (msg) ->
    msg.reply msg.random ram
  robot.hear /らーめん/i, (msg) ->
    msg.reply msg.random ram
  robot.hear /ra-men/i, (msg) ->
    msg.reply msg.random ram
  robot.hear /ラーメソ/i, (msg) ->
    msg.reply msg.random ram
    
  robot.hear  /アップルID/i, (msg) ->
    msg.reply "cv_tech_qa@carview.co.jp　PASS:6165!appleCV"

  robot.hear  /神/i, (msg) ->
    msg.reply "綱様"
    
    
  robot.hear  /号泣/i, (msg) ->
    msg.reply "そういう問題ッヒョオッホーーー！！　解決ジダイガダメニ！　俺ハネェ！　ブフッフンハアァア！！"
    
  robot.hear  /寿限無/i, (msg) ->
    msg.reply "じゅげむ　じゅげむ　ごこうのすりきれ　かいじゃりすいぎょの　すいぎょうまつ　うんらいまつ　ふうらいまつ　くうねるところにすむところ　やぶらこうじのぶらこうじ　ぱいぽ　ぱいぽ　ぱいぽのしゅーりんがん　しゅーりんがんのぐーりんだい　ぐーりんだいのぽんぽこぴーの　ぽんぽこなーの　ちょうきゅうめいのちょうすけ"


  robot.hear  /運行/i, (msg) ->
    msg.reply "http://transit.yahoo.co.jp/traininfo/area/4/"
    
   robot.hear  /wifi/i, (msg) ->
    msg.reply "carviewwireless,carviewSecurityWireless or carviewguest,carviewGuestAccess"
    
    robot.hear  /画像テスト/i, (msg) ->
    msg.reply "http://cdn.snsimg.carview.co.jp/carlife/storage/2480792/plus/bb7b9e10f1.jpg?ct=a641d2c6ec69"
    
    
  # redisに保存するためのキー
  KEY_DERBY_POINTS = 'derby_points'

  # 対象と点数を指定
  robot.hear /^(.*)さんに([0-9]+)点/, (msg) ->
    name  = msg.match[1]
    points = (robot.brain.get KEY_DERBY_POINTS) or {}
    points[name] = (points[name] or 0) + Number(msg.match[2])

    robot.brain.set KEY_DERBY_POINTS, points

    msg.send "#{name}さん: #{points[name]}点"

  # 点数の合計を表示
  robot.respond /derby list/i, (msg) ->
    points = (robot.brain.get KEY_DERBY_POINTS) or {}
    for name, point of points
      msg.send "#{name}さん: #{point}点"

  # 点数をリセット
  robot.respond /derby reset/i, (msg) ->
    robot.brain.set KEY_DERBY_POINTS, {}
    msg.send "reset: done"
    
  robot.hear /(.*)の天気/i, (msg) ->
   switch msg.match[1]
      when '今日'
        day = 0
      when '明日'
        day = 1
      when '明後日'
        day = 2
      else
        day = 3
        break
    request = msg.http('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010')
    .get()
    request (err, res, body) ->
      json = JSON.parse body
      if day == 3 then forecast = 'わからんす' else forecast = json['forecasts'][day]['telop']
      msg.reply forecast
      
  robot.hear  /jugemu/i, (msg) ->
    msg.reply "Jugemu of Jugemu Miyuki worn paddle of gravel Suigyo crowded the end of the line Unrai of pine Fuurai pine dwells at Kuuneru broken Koji bra construction Paipo Paipo Paipo shoe Ringan shoe Ringan of Gurindai Gurindai of Ponpo copies of the butterfly life-saving Ponpokona Chosuke"

      