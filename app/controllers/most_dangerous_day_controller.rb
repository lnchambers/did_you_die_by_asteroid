class MostDangerousDayController < ApplicationController
  def index
    @asteroids = AsteroidPresenter.new(params).run
  end
end
