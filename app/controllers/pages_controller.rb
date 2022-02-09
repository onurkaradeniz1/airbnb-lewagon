class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    all_flats = Flat.all
    sorted_flats = all_flats.sort_by{ |flat| flat.average_rating[:average] }.reverse
    @top_rated = sorted_flats.first(5)
  end
end
