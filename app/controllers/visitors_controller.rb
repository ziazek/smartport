class VisitorsController < ApplicationController
  def about
    @users = User.all
  end
end
