class Hangman.Models.Phrase extends Backbone.Model
  url: "api/hangman/phrase"

  guess: (guess, view)->
    model = @
    options = {
      type: "get"
      data:
        # Not sure why we have to use $.param here...
        jQuery.param({letter: "#{guess}"})
      url: model.url + '/guess'
      dataType: 'json'
      success: (resp, status, xhr) ->
        view.responseText = resp
        view.trigger('guessResponse')
    }
    return (@.sync || Backbone.sync).call(@, 'guess', @, options)
