class Hangman.Routers.Words extends Backbone.Router
  routes:
    '': 'index'
    'words/:id': 'show'

  index: ->
    view = new Hangman.Views.WordsIndex()
    $('#container').html(view.render().el)

  show: (id)->
    alert "Word #{id}"
