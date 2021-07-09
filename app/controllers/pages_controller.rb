class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def homepage
    @users = User.all
  end

  def about
  end
end
