class Hangman.Models.Guess extends Backbone.Model
  url: "api/hangman/guess"
  initialize: (guess) ->
    @guess = guess
  execute: ->
    model = @

    options = {
      type: "GET"
      url: model.url + '/' + @guess
      success: (resp, status, xhr) ->
        console.log(resp)
    }

    return (@.sync || Backbone.sync).call(@, 'execute', @, options)

