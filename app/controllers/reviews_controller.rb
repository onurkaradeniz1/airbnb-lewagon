class ReviewsController < ApplicationController
  before_action :find_user
  before_action :find_booking, only: [ :index, :new, :create ]
  before_action :find_review, only: [ :show, :edit, :update, :destroy ]

  def index
    @reviews = Review.where(@booking.user_id == @user.id)
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking_id = @booking.id
    @review.save
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @review.update(review_params)

    redirect_to review_path(@review)
  end

  def destroy
    @review.destroy
    redirect_to reviews_path
  end

  private

  def find_user
    @user = current_user
  end

  def find_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:integer, :content)
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
