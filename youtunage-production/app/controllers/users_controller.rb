class UsersController < ApplicationController
  def index
    @users = User.all

    render("users/index.html.erb")
  end

  def show
    @users = User.find(params[:id])
@media = Medium.all
    render("users/show.html.erb")
  end

end
