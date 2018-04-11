class Asteroid

  attr_reader :id, :name, :is_potentially_dangerous, :close_approach_date

  def initialize(args)
    @id                       = args[:neo_reference_id]
    @name                     = args[:name]
    @is_potentially_dangerous = args[:is_potentially_hazardous_asteroid]
    @close_approach_date      = args[:close_approach_data][0][:close_approach_date]
  end
end
