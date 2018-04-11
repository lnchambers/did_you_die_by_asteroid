class AsteroidPresenter

  def initialize(params)
    @start_date = params[:start_date]
    @end_date = params[:end_date]
  end

  def asteroids
    MostDangerousAsteroidsByDate.new(start_date, end_date).asteroids
  end

  def date_range

  end

  private

    attr_reader :start_date, :end_date

end
