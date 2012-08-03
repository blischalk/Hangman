class Hangman.Views.Phrase extends Backbone.View
  template: JST['phrases/phrase']

  render: ->
    $(@el).html(@template(phrase: @phrase))
    this

