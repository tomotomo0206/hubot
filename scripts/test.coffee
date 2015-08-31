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
    

  robot.hear  /運行/i, (msg) ->
    msg.reply "http://transit.yahoo.co.jp/traininfo/area/4/"
    
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
