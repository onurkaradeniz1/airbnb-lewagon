class BookingsController < ApplicationController
  before_action :find_user
  before_action :find_booking, only: [ :show, :edit, :update, :destroy ]
  before_action :find_flat, only: [ :new, :create ]

  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def show
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = @user.id
    @booking.flat_id = @flat.id
    @booking.total_price = ((@booking.last_day_of_booking - @booking.first_day_of_booking).to_i) * @flat.price_per_day
    authorize @booking
    @booking.save
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
    authorize @booking
  end

  def update
    new_id = @booking.flat_id
    @flat = Flat.find(new_id)
    @booking.update(booking_params)
    @booking.total_price = ((@booking.last_day_of_booking - @booking.first_day_of_booking).to_i) * @flat.price_per_day
    authorize @booking
    @booking.save

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to flats_path
  end


  private

  def booking_params
    params.require(:booking).permit(:total_price, :first_day_of_booking, :last_day_of_booking)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def find_user
    @user = current_user
  end

  def find_flat
    @flat = Flat.find(params[:flat_id])
  end

  # def total_price
  #   @flat.price_per_day * @booking.date_booked.length
  # end
end
