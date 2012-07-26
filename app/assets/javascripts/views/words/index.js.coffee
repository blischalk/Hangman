class Hangman.Views.WordsIndex extends Backbone.View

  template: JST['words/index']

  render: ->
    $(@el).html(@template(words: 'Words go here...'))
    this
