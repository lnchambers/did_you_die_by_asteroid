class MostDangerousDayController < ApplicationController
  def index
    @asteroids = MostDangerousAsteroidsByDate.new(params).asteroids
  end
end
