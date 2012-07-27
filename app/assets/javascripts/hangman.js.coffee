window.Hangman =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    new Hangman.Routers.Phrases
    Backbone.history.start(pushState: true)

$(document).ready ->
  Hangman.init()
