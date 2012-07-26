class Hangman.Views.Word extends Backbone.View
  template: JST['words/word']
  tagName: 'li'

  render: ->
    $(@el).html(@template(word: @model))
    this
