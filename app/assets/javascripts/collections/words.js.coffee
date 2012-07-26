class Hangman.Collections.Words extends Backbone.Collection
  url: 'api/words'

  model: Hangman.Models.Word
