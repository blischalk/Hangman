class Hangman.Views.Phrase extends Backbone.View
  template: JST['phrases/phrase']
  tagName: 'li'

  events:
    'click': 'showPhrase'

  render: ->
    $(@el).html(@template(phrase: @model))
    this

  showPhrase: ->
    Backbone.history.navigate("phrases/#{@model.get('id')}", true)
