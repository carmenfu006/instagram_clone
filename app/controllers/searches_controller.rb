class SearchesController < ApplicationController
  def index
    if params['search']
      users = User.all
      @users = users.where('username LIKE ?', "%#{params['search']}%")
    else
      @users = User.all
    end
  end
end