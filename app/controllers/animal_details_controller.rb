class AnimalDetailsController < ApplicationController
  before_action :set_animal_detail, only: [:show, :edit, :update, :destroy]

  # GET /animal_details
  def index
    @animal_details = AnimalDetail.all
  end

  # GET /animal_details/1
  def show
  end

  # GET /animal_details/new
  def new
    @animal_detail = AnimalDetail.new
  end

  # GET /animal_details/1/edit
  def edit
  end

  # POST /animal_details
  def create
    @animal_detail = AnimalDetail.new(animal_detail_params)

    if @animal_detail.save
      redirect_to @animal_detail, notice: 'Animal detail was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /animal_details/1
  def update
    if @animal_detail.update(animal_detail_params)
      redirect_to @animal_detail, notice: 'Animal detail was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /animal_details/1
  def destroy
    @animal_detail.destroy
    redirect_to animal_details_url, notice: 'Animal detail was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal_detail
      @animal_detail = AnimalDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def animal_detail_params
      params.fetch(:animal_detail, {})
    end
end
