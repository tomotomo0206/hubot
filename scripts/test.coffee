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
ram2 = ['http://angel.ap.teacup.com/mirin/img/1244108709.jpg','http://nekoore.com/wp/wp-content/uploads/2014/05/201312seven-dwarfs-cosplay-1.jpg','http://img01.boo-log.com/usr/nekopon/%E9%AC%BC%E3%81%8B%E3%81%B6%E3%82%8A%E3%82%82%E3%81%AE.png','http://chatnoir666.com/wp-content/uploads/2015/03/knuttz-ueba-305111.jpg', 'http://tetoan.com/wp-content/uploads/2015/05/%E8%A2%8B%E3%81%AB%E5%85%A5%E3%81%A3%E3%81%9F%E3%83%9A%E3%83%AB%E3%82%B7%E3%83%A3%E7%8C%AB.jpg', 'https://i.ytimg.com/vi/FF2r7mnf180/maxresdefault.jpg', 'http://nekogazou.com/wp-content/uploads/2013/03/1104.jpg', 'http://myu-cat.jp/file/parts/I0000002/ab8097822341c1e2c4e8f0aecd239b98.jpg', 'http://ecx.images-amazon.com/images/I/41V1me-RnKL.jpg', 'http://nekopple.com/wp-content/uploads/2015/09/image.jpeg']

module.exports = (robot) ->
  robot.hear /ラーメン/i, (msg) ->
    msg.reply msg.random ram
  robot.hear /らーめん/i, (msg) ->
    msg.reply msg.random ram
  robot.hear /ra-men/i, (msg) ->
    msg.reply msg.random ram
  robot.hear /ラーメソ/i, (msg) ->
    msg.reply msg.random ram
    
    
  robot.hear /にゃんにゃん/i, (msg) ->
    msg.reply msg.random ram2
    
  robot.hear /バルス/i, (msg) ->
    msg.reply  "目がぁぁぁ、目がぁぁぁぁ"
    
  robot.hear /安西先生/i, (msg) ->
    msg.reply  "諦めたらそこで試合終了ですよ"


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
    
   robot.hear  /ハボi/i, (msg) ->
    msg.reply "ハボとはユーザーファースト推進室のみんなのアイドルのことです。"
    

    
    
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

      