class FlatsController < ApplicationController
  before_action :find_user
  before_action :find_flat, only: [ :show, :edit, :update, :destroy ]

  def index
    @flats = Flat.all
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user_id = @user.id
    @flat.save
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def edit
  end

  def update
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:price_per_day, :address, :pictures, :availability, :description, :capacity)
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def find_user
    @user = current_user
  end
end
