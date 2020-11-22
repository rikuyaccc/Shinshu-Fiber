class ClassroomsController < ApplicationController

  PER = 21
  
  def index
    @classrooms = Classroom.page(params[:page]).per(PER)
  end

  def show 
    @classroom = Classroom.find(params[:id])
    @reviews = @classroom.reviews
  end
  
  def rate
    @classroom = Classroom.find(params[:id])
    @review = Review.new
  end

  def search
    @classroom_or_club = params[:option]
    if @classroom_or_club == "1"
      @classrooms = Classroom.search(params[:search], @classroom_or_club)
    else
      @clubs = Club.search(params[:search], @classroom_or_club)
    end
  end

end