class AdoptionAnimalsController < ApplicationController

  before_action :set_adoption_animal, only: [:show]

  def index
    @adoption_animals = AdoptionAnimal.all
  end

  def show
    # @adoption_animal = AdoptionAnimal.find(params[:id])
  end

  def new
    @adoption_animal = AdoptionAnimal.new
  end

  def create
    @adoption_animal = AdoptionAnimal.new(adoption_animal_params)

    if @adoption_animal.save
      redirect_to @adoption_animal, notice: 'Adoption Animal was successfully created.'
    else
      render :new
    end
  end

  private

    def set_adoption_animal
      @adoption_animal = AdoptionAnimal.find(params[:id])
    end

    def adoption_animal_params
      params.require(:adoption_animal).permit(:species, :name, :pet_id, :gender, :fixed, :breed, :found_on, :scraped_at, :shelter_id, :image_id)
    end
end
