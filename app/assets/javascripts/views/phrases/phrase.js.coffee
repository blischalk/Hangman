class Hangman.Views.Phrase extends Backbone.View
  template: JST['phrases/phrase']

  render: ->
    console.log(@collection.shuffle())
    $(@el).html(@template(phrase: @phrase))
    this

