class MostDangerousDayController < ApplicationController
  def index
    @asteroids = AsteroidService.new(params).run
  end
end
