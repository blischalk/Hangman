class PhrasesController < ApplicationController
  respond_to :json

  def index
    respond_with Phrase.all
  end

  def show
    respond_with Phrase.find(params[:id])
  end

  def create
    respond_with Phrase.create(params[:phrase])
  end

  def update
    respond_with Phrase.update(params[:id], params[:phrase])
  end

  def destroy
    respond_with Phrase.destroy(params[:id])
  end

end
