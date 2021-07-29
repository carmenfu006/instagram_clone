class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def homepage
    if params['search']
      users = User.all
      @users = users.where('username LIKE ?', "%#{params['search']}%")
    else
      @users = User.all
    end
  end

  def about
  end
end
