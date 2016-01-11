module.exports = (robot) ->
  lulz = ['lol', 'rofl', 'lmao']

  robot.respond /lulz/i, (res) ->
    res.send res.random lulz

  robot.listenerMiddleware (context, next, done) ->
    # console.log context.response.message
    if context.response.message.text == 'pjcbot help'
      context.response.send context.response.random lulz
      context.response.send "I'm sorry, @#{context.response.message.user.name}, I can't let you do that."
      done()
    else
      # This is not a restricted command; allow everyone
      next()
