module.exports = (robot) ->
  lulz = ['lol', 'rofl', 'lmao', 'haha nice try', '**snort**', 'heh, you wish']
  gasp = [
    "http://media.tumblr.com/33c27548b8705e0ad04ca9c3ccca8976/tumblr_inline_mwg3jsMHmJ1r46c0d.gif",
    "http://i29.tinypic.com/34rsrwm.jpg",
    "http://24.media.tumblr.com/0e28faae2ce73796864a1720eecac5cc/tumblr_mn3pogYBV61rzxujso1_500.gif",
    "https://uproxx.files.wordpress.com/2012/06/tyrion-smirk.gif?w=650",
    "https://lh3.googleusercontent.com/-G1EW1uhCf_Q/VBIRsBLtljI/AAAAAAAAFAQ/q8mN17nKXms/w426-h237/nicholas-cage-reaction-awkward-no.gif",
    "http://38.media.tumblr.com/5625dc3d81804bcee01803dbd9671428/tumblr_nf2sjd9hBk1ryxj2so4_250.gif",
    "http://images.halloweencostumes.com/blog/images/595/1897-1/ron-burgundy-beard-of-zeus.gif",
    "http://3.bp.blogspot.com/-aclBW6_8gKQ/UKlmgGCfKCI/AAAAAAAAApg/izDYSzpnF4w/s1600/dawson+crying.gif",
    "http://49.media.tumblr.com/0e55e90ac7bddc0dbba220fa996e8642/tumblr_mws9zwJUxg1qm1x8bo4_250.gif",
    "http://i.imgur.com/kYpmDXM.gif",
    "http://www.shemazing.net/wp-content/uploads/2015/11/tumblr_m9jkr4efxl1rw1mux.gif",
    "https://media.giphy.com/media/chdKTA4xU9gvC/giphy.gif",
    "https://media.giphy.com/media/P12bvrj00Hrb2/giphy.gif",
    "https://38.media.tumblr.com/tumblr_lpkljecvlY1qcb7ty.gif",
    "https://claribelortegaauthorblog.files.wordpress.com/2016/01/mobile-age.gif?w=676",
    "http://fandomania.com/wp-content/uploads/2016/01/25/the-finale-showdown-lost-4.gif",
    "http://img4.hostingpics.net/pics/783492jimduckface.gif",
    "http://1.bp.blogspot.com/-vGdfFzKFebk/Uo4tbMyLC6I/AAAAAAAABeM/b61ASJU4Bn0/s320/not-listening-dumb-and-dumber-o.gif",
    "http://www.qafcaps.com/noahwho/ReidRollingEyes.gif",
    "http://img.pandawhale.com/post-51491-LOST-Hurley-WHAT-gif-Imgur-gfy-hgvM.gif",
    "https://i1.wp.com/www.reactiongifs.com/r/wtfih.gif",
    "http://s3-ec.buzzfed.com/static/2014-03/enhanced/webdr07/15/18/anigif_enhanced-buzz-23932-1394921588-9.gif",
    "http://imagesmtv-a.akamaihd.net/uri/mgid:file:http:shared:mtv.com/news/wp-content/uploads/2014/09/giphy-111.gif",
    "http://static.stereogum.com/uploads/2010/04/hurley.gif",
    "https://45.media.tumblr.com/99144acc92400ef54bb3cbac831f4244/tumblr_nyfu0e44mJ1udtkipo1_500.gif",
    "http://img.pandawhale.com/post-62197-LOST-Hurley-not-listening-fing-Z0iB.gif",
    "http://45.media.tumblr.com/25d7c3ecb186b7a52ae35cda1198acf0/tumblr_nlg2rgWfsO1uqcquro2_250.gif",
    "http://i40.tinypic.com/98rccx.jpg",
    "https://media.giphy.com/media/V4X5ln2fGlxmg/giphy.gif",
    "https://cmgpbpsuperfun.files.wordpress.com/2015/04/giphy.gif"
  ]

  robot.hear /hubot(.*)/i, (res) ->
    response = "Sorry, I'm a diva and only respond to #{robot.name}"
    response += " or #{robot.alias}" if robot.alias
    res.reply response
    return

  robot.listen(
    (message) ->
      message.user.name is 'paulfreedman' and Number(message.text)
    (response) ->
      if Math.random() > 0.5
        response.send response.random gasp
      else
        num = Number(response.message.text)
        response.send ['fizz' unless num%3] + ['buzz' unless num%5] or "#{num} is neither fizz nor buzz"
  )

  robot.listenerMiddleware (context, next, done) ->
    if context.response.message.text.indexOf('funbot help') == 0
      context.response.send context.response.random lulz
      context.response.send "I'm sorry, @#{context.response.message.user.name}, I can't let you do that."
    else
      next()
