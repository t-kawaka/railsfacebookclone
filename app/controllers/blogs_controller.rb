class BlogsController < ApplicationController
   before_action :authenticate_user! , only: [:edit, :update, :destroy]
  def home
  end
end
