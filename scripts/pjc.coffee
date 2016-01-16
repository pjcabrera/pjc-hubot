module.exports = (robot) ->
  lulz = ['lol', 'rofl', 'lmao', 'haha nice try', '**snort**', 'you wish']

  robot.hear /^hubot:? (.+)/i, (res) ->
    response = "Sorry, I'm a diva and only respond to #{robot.name}"
    response += " or #{robot.alias}" if robot.alias
    res.reply response
    return

  robot.listenerMiddleware (context, next, done) ->
    if ~context.response.message.text.indexOf('pjcbot help')
      context.response.send context.response.random lulz
      context.response.send "I'm sorry, @#{context.response.message.user.name}, I can't let you do that."
      done()
    else
      next()
