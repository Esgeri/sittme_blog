class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about]

  def welcome; end

  def about; end
end
