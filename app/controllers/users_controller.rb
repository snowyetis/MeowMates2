# Copyright (c) 2015, @sudharti(Sudharsanan Muralidharan)
# Socify is an Open source Social network written in Ruby on Rails This file is licensed
# under GNU GPL v2 or later. See the LICENSE.

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :check_ownership, only: [:edit, :update]
  respond_to :html, :js

  def index
  end

  def show
    @activities = PublicActivity::Activity.where(owner: @user).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:notice] = "Your profile has been updated."
    else
      render :edit
      flash[:error] = "There was an error while updating your profile."
    end
  end

  def deactivate
  end

  def animals
    @animals = @user.animals.paginate(page: params[:page])
  end

  def friends
    @friends = @user.following_users.paginate(page: params[:page]).find_each.lazy
  end

  def followers
    @followers = @user.user_followers.paginate(page: params[:page]).find_each.lazy
  end

  def mentionable
    render json: @user.following_users.as_json(only: [:id, :name]), root: false
  end

  private

  def user_params
    params.require(:user).permit(:name, :about, :avatar, :cover,
                                 :sex, :dob, :location, :phone_number)
  end

  def check_ownership
    redirect_to current_user, notice: 'Not Authorized' unless @user == current_user
  end

  def set_user
    @user = User.friendly.find(params[:id])
  end

  # def set_user_animals
  #   @user = User.animals.find(params[:id])
  # end

end
