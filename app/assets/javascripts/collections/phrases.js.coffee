class Hangman.Collections.Phrases extends Backbone.Collection
  url: 'api/phrases'

  model: Hangman.Models.Phrase

  initialize: ->
    @bind('reset', @setPhrase, this)

  setPhrase: ->
    if !Hangman.phrase
      Hangman.phrase = @shuffle()[0]
