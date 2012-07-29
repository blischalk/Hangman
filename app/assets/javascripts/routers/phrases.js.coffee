class Hangman.Routers.Phrases extends Backbone.Router
  routes:
    '': 'index'

  initialize: ->
    @collection = new Hangman.Collections.Phrases()
    @collection.reset($('#container').data 'phrases')

  index: ->
    view = new Hangman.Views.PhrasesIndex(collection: @collection)
    $('#container').html(view.render().el)
