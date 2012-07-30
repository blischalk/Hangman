class Hangman.Collections.Phrases extends Backbone.Collection
  url: 'api/phrases'

  model: Hangman.Models.Phrase

  initialize: ->
    @bind('reset', @setGameVars, this)

  setGameVars: ->
    Hangman.phrase = @shuffle()[0]
    Hangman.wrongAnswers = 0
