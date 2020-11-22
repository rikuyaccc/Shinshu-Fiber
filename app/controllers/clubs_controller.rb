class ClubsController < ApplicationController

  def index
    @clubs = Club.all.page(params[:page])
  end

  def show
    @club = Club.find(params[:id])
  end

  def new 
    @club = Club.new
  end

  def create
    @club = Club.create(params_club)
    redirect_to clubs_path
  end

  private
    def params_club
      params.require(:club).permit(:name, :profile)
    end
    
end