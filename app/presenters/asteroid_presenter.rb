class AsteroidPresenter

  def initialize(params)
    @start_date = Time.parse(params[:start_date]).strftime('%F')
    @end_date = Time.parse(params[:end_date]).strftime('%F')
  end

  def run
    all_asteroids
    return self
  end

  def all_asteroids
    MostDangerousAsteroidsByDate.new(start_date, end_date).asteroids
  end

  def date_range
    "#{Time.parse(start_date).strftime('%B %-d, %Y')} - #{Time.parse(end_date).strftime('%B %-d, %Y')}"
  end

  def most_dangerous_day
    group_dangerous_asteroids.values.max_by do |asteroids|
      asteroids.count
    end
  end

  def most_dangerous_day_format
    "#{Time.parse(most_dangerous_day.first.close_approach_date).strftime('%B %-d, %Y')}"
  end

  private

    attr_reader :start_date, :end_date

    def dangerous_asteroids
      all_asteroids.reduce([]) do |result, asteroid|
        if asteroid.is_potentially_dangerous == true
          result << asteroid
        else
          result
        end
      end
    end

    def group_dangerous_asteroids
      dangerous_asteroids.group_by do |asteroid|
        asteroid.close_approach_date
      end
    end

end
