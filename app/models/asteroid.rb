class Asteroid

  def initialize(args)
    @id                                = args[:neo_reference_id]
    @name                              = args[:name]
    @is_potentially_dangerous_asteroid = args[:is_potentially_dangerous_asteroid]
    @close_approach_date               = args[:close_approach_data][:close_approach_date]
  end
end
