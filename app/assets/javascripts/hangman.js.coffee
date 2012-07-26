window.Hangman =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    new Hangman.Routers.Words
    Backbone.history.start()

$(document).ready ->
  Hangman.init()
