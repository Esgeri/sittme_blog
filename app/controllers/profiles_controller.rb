class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @page = (params[:page] || 0).to_i
    @users = User.on_created_at.offset(3 * @page).limit(3)
  end

  def show
    @user = User.find(params[:id])
  end
end
