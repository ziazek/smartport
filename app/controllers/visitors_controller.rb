class VisitorsController < ApplicationController
  def index
    chart = Chart.new 
    @averages = chart.averages_by_month(crane: 0, container: 0)
    gon.ranges = chart.ranges_ary
    gon.average_hours = chart.average_hours_ary
  end

  def new_ship
    
  end

  def about
    @users = User.all
  end

end
