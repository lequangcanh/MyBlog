class HomeController < ApplicationController
  def index
    @user = current_user
    @entries = @user.feed.paginate(page: params[:page])
  end
end
