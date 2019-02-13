class WelcomeController < ApplicationController
  before_action :build_object, only: :throw
  # GET /welcomes
  def index; end

  # POST /welcomes/throw
  def throw
    render json: @game.throw(throw_params).as_json
  end

  private

  # Build object for games
  def build_object
    @game = Game.new
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def throw_params
    params.fetch(:throw, {})
  end
end
