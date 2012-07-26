class Hangman.Views.Word extends Backbone.View
  template: JST['words/word']
  tagName: 'li'

  events:
    'click': 'showWord'

  render: ->
    $(@el).html(@template(word: @model))
    this

  showWord: ->
    Backbone.history.navigate("words/#{@model.get('id')}", true)
