# Description:
#   The Magic Eight ball
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   eightball|eight ball|eight-ball|8ball <query> - Ask the magic eight ball a question
#
# Author:
#   ryanatwork

ball = [
  "http://pjtrix.com/funbot/8ball/8ball01.png",
  "http://pjtrix.com/funbot/8ball/8ball02.png",
  "http://pjtrix.com/funbot/8ball/8ball03.png",
  "http://pjtrix.com/funbot/8ball/8ball04.png",
  "http://pjtrix.com/funbot/8ball/8ball05.png",
  "http://pjtrix.com/funbot/8ball/8ball06.png",
  "http://pjtrix.com/funbot/8ball/8ball07.png",
  "http://pjtrix.com/funbot/8ball/8ball08.png",
  "http://pjtrix.com/funbot/8ball/8ball09.png",
  "http://pjtrix.com/funbot/8ball/8ball10.png",
  "http://pjtrix.com/funbot/8ball/8ball11.png",
  "http://pjtrix.com/funbot/8ball/8ball12.png",
  "http://pjtrix.com/funbot/8ball/8ball13.png",
  "http://pjtrix.com/funbot/8ball/8ball14.png",
  "http://pjtrix.com/funbot/8ball/8ball15.png",
  "http://pjtrix.com/funbot/8ball/8ball16.png"
]

module.exports = (robot) ->
  robot.hear /(eight(ball| ball|-ball)|8ball|should I|I wonder if I should)(.*)/i, (msg) ->
    msg.reply msg.random ball
