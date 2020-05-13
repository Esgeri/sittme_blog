class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:welcome, :about, :json_data]

  def welcome; end

  def about; end

  def json_data
    cursor = (params[:cursor] || 0).to_i

    @users = User.where("id > ?", cursor).on_created_at

    render json: @users
  end
end
