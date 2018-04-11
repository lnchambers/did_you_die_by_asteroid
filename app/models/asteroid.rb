class Asteroid

  def initialize(args)
    @id                                = args[1][0][:neo_reference_id]
    @name                              = args[1][0][:name]
    @is_potentially_dangerous_asteroid = args[1][0][:is_potentially_dangerous_asteroid]
    @close_approach_date               = args[0].to_s
  end
end
