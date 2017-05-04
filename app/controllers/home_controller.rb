# Copyright (c) 2015, @sudharti(Sudharsanan Muralidharan)
# Socify is an Open source Social network written in Ruby on Rails This file is licensed
# under GNU GPL v2 or later. See the LICENSE.

class HomeController < ApplicationController
  before_action :set_user, except: :front
  respond_to :html, :js

  def index
    @post = Post.new
    @animal = Animal.new
    @friends = @user.all_following.unshift(@user)
    @activities = PublicActivity::Activity.where(owner_id: @friends).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def front
    @front = true
    @gallery_view = true
    @animals = Animal.order("RANDOM()").limit(10) # SQLite abd PostgresSQL syntax
  end

  def find_friends
    # @friends = User.includes(:follows)
    @friends = @user.all_following.unshift(@user)
    @users =  User.where.not(id: @friends.unshift(@user)).paginate(page: params[:page])
    # @users = User.where.not(id: @friends).paginate(page: params[:page])
  end

  private

  def set_user
    @user = current_user
  end

end
