class AnimalsController < ApplicationController
# before_action :authenticate_user!
before_action :set_animal, only: [:show, :edit, :update, :destroy]

def index
  @animals = Animal.all
  render @animals
end

def show
  @animals = current_user.animals
end

def new
end

def create
  @animals  = current_user.animals.new(animal_params)
  if @animals.save
    redirect_to root_path
  else
    redirect_to root_path, notice: @animals.errors.full_messages.first
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
