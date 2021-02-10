class UniversitiesController < ApplicationController
  def create
    puts("abacatero")
    @university = University.new(params)

    if @university.save!
      redirect_to @university
    else
      render "new"
    end
  end

  def show

  end
end