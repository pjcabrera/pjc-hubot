# Description:
#   Jargon Memes is summoned when configurable jargon is used
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_MEMES_JARGON comma-separated list of additional "tiggers"
#   HUBOT_OMMITED_MEMES_JARGON comma-separated list of "tiggers" to not trigger
#
# Commands:
#   jargon - summons business cat
#
# Notes:
#   See jargon array for list of trigger phrases
#
# Author:
#   PJ Cabrera <pj.cabrera@gmail.com> (https://github.com/pjcabrera)
#   Based on Hubot Business Cat by Morgan Wigmanich <okize123@gmail.com> (https://github.com/okize)

images = require './jargondata/images.json'
jargon = require './jargondata/jargon.json'

removeTerm = (term, arrayToDeleteFrom) ->
  index = arrayToDeleteFrom.indexOf term
  if index > -1
    arrayToDeleteFrom.splice index, 1
    return arrayToDeleteFrom

if process.env.HUBOT_MEMES_JARGON?
  additionalJargon = (process.env.HUBOT_MEMES_JARGON).split(',')
  jargon = jargon.concat(additionalJargon)

if process.env.HUBOT_OMMITED_MEMES_JARGON?
  omittedJargon = (process.env.HUBOT_OMMITED_MEMES_JARGON).split(',')
  jargon = removeTerm(term, jargon) for term in omittedJargon

regex = new RegExp jargon.join('|'), 'gi'

module.exports = (robot) ->
  robot.hear regex, (msg) ->
    msg.send msg.random images