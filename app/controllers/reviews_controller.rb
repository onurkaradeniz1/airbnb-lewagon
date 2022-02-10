class ReviewsController < ApplicationController
  before_action :find_user
  before_action :find_booking, only: [ :new, :create ]
  before_action :find_review, only: [ :show, :edit, :update, :destroy ]

  def index
    reviews_all = policy_scope(Review)
    @reviews = reviews_all.select do |review|
      booking = Booking.find(review.booking_id)
      booking.user_id == @user.id
    end
  end

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.booking_id = @booking.id
    authorize @review
    @review.save
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def show
    authorize @review
  end

  def edit
    authorize @review
  end

  def update
    authorize @review
    @review.update(review_params)

    redirect_to review_path(@review)
  end

  def destroy
    authorize @review
    @review.destroy
    redirect_to bookings_path
  end

  private

  def find_user
    @user = current_user
  end

  def find_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
