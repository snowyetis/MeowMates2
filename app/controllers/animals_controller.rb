class AnimalsController < ApplicationController
before_action :authenticate_user!
before_action :set_animal, only: [:show, :edit, :update, :destroy, :show_gallery_detail]

def index
  @galleryView = true
  @animals = Animal.all

end

def show
  @activities = PublicActivity::Activity.where(owner: @user).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
end

def show_gallery_detail
end

def new
end

def create
  @animals  = current_user.animals.new(animal_params)

  if @animals.save
    # TODO: I don't think I need this
    # @animals.animal_intro_avatar.url
    redirect_to root_path, notice: @animals.animalName + " has been posted, successfully."
  else
    redirect_to root_path, error: @animals.errors.full_messages.first
  end
end

def destroy
  @animal.destroy
  respond_to do |format|
    format.js
    format.html { redirect_to root_path }
  end
end

def edit
end

def update
  @animal.update(animal_params)
  redirect_to @animal
end

private

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def set_user_animals
    @animals = Animal.find(params[:user_id])
  end

  def animal_params
    params.require(:animal).permit(:animalName, :gender, :age, :dob, :shots, :fixed,
                                   :content, :user_id, :animal_intro_avatar, :location)
  end

end
