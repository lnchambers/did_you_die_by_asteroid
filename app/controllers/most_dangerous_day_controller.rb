class MostDangerousDayController < ApplicationController
  def index
    @asteroids = AsteroidPresenter.new(params).run
    binding.pry
  end
end
