class PageController < ApplicationController

  def about
  end

  def team
    @staff = User.staff
    @directors = User.directors
    @break_leaders = User.break_leaders
  end

end