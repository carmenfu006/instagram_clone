class PagesController < ApplicationController
  def homepage
    @users = User.all
  end

  def about
  end
end
