class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about, :json_data]

  def welcome; end

  def about; end

  def json_data
    @users = User.on_created_at
    render json: @users
  end
end
