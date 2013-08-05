class PageController < ApplicationController

  def about
  end

  def team
    @directors = User.directors
    @break_leaders = User.break_leaders
  end

end