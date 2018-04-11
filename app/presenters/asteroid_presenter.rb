class AsteroidPresenter

  def initialize(params)
    @start_date = params[:start_date]
    @end_date = params[:end_date]
  end

  def all_asteroids
    MostDangerousAsteroidsByDate.new(start_date, end_date).asteroids
  end

  def date_range
    "#{Time.parse(start_date).strftime('%B %d, %Y')} - #{Time.parse(end_date).strftime('%B %d, %Y')}"
  end

  def most_dangerous_day
    binding.pry
  end

  private

    attr_reader :start_date, :end_date

end
