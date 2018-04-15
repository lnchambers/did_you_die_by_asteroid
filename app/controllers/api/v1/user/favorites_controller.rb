class Api::V1::User::FavoritesController < ApiBaseController
  def index
    render json: FavoritedAsteroid.new(Favorite.new, current_user).json_response_index
  end

  def create
    favorite = Favorite.new(neo_reference_id: params[:neo_reference_id], user: current_user)
    if favorite.save
      render json: FavoritedAsteroid.new(favorite, current_user).json_response_create
    else
      render json: { message: "Invalid credentials." }
    end
  end

end
