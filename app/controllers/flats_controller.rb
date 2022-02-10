class FlatsController < ApplicationController
  before_action :find_user, :database_search
  before_action :find_flat, only: %i[show edit update destroy]

  def index
    # @flats = Flat.all
    @flats = policy_scope(Flat)

      @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window: render_to_string(partial: "info_window", locals: { flat: flat }),
        #image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
      }
    end
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user_id = @user.id
    authorize @flat
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
  end

  def edit
  end

  def update
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy
    redirect_to my_flats_path
  end

  def my_flats
    @flats = current_user.flats
    authorize @flats
  end

  def search
    if params[:query].present?
      @flats = Flat.search_by_country_city_address(params[:query])
    else
      @flats = Flat.all
    end
    @count = @flats.count
    @query = params[:query]

    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window: render_to_string(partial: "info_window", locals: { flat: flat }),
        #image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
      }
    end
    authorize @flats
    # authorize @markers
  end

  private

  def flat_params
    params.require(:flat).permit(:price_per_day, :city, :country, :address, :photo, :start_date, :end_date, :description, :capacity)
  end

  def find_flat
    if Flat.find_by(id: params[:id]).nil?
      redirect_to error_path
    else
      @flat = Flat.find(params[:id])
      authorize @flat
    end
  end

  def find_user
    @user = current_user
  end

  def database_search
    @markers = Flat.all
  end
end
