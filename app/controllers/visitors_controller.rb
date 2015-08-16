class VisitorsController < ApplicationController
  def index
    chart = Chart.new 
    @averages = chart.averages_by_month(crane: 0, container: 0)
    gon.ranges = chart.ranges_ary
    gon.average_hours = chart.average_hours_ary
    gon.main_average = chart.main_average
    gon.records = chart.records
    @incident_1 = chart.averages_by_month(crane: 0, container: 1)
    gon.ranges1 = chart.ranges_ary
    gon.average_hours1 = chart.average_hours_ary
    gon.main_average1 = chart.main_average
    gon.records1 = chart.records
    @incident_2 = chart.averages_by_month(crane: 1, container: 1)
    gon.ranges2 = chart.ranges_ary
    gon.average_hours2 = chart.average_hours_ary
    gon.main_average2 = chart.main_average
    gon.records2 = chart.records
  end

  def incident_occurred
    chart = Chart.new 
    @averages = chart.averages_by_month(crane: 0, container: 1)
    gon.ranges = chart.ranges_ary
    gon.average_hours = chart.average_hours_ary
    gon.main_average = chart.main_average
  end

  def new_ship
    
  end

  def about
    @users = User.all
  end

end
