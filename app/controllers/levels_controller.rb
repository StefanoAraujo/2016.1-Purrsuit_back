class LevelsController < ApplicationController
  def all
    render json: Level.all
  end

end
