class AnimalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_animal, only: [:show, :edit, :update, :destroy, :show_gallery_detail, :send_adopt_notification]

  def index
    @galleryView = true
    @animals = Animal.all
    @animals.each do |animal|
      find_like(animal)

      if animal.animal_intro_avatar.url.blank?
        @image = false
      else
        @image = true
      end

    end
  end

  def show
    @activities = PublicActivity::Activity.where(owner: @user, trackable_type: 'Animal').order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def show_gallery_detail
  end

  def new
  end

  def check_and_show_form
    # render js: "$('.post_form').hide(); $('#detail_form').html('<%= escape_javascript(render partial: 'animal_details/form', locals: { product: @animal } )%>')"
  end

  # def show_rating_form
  #   @animal =  Animal.new
  #   @animal_detail = @animal.build_animal_detail
  #
  #   respond_to do |format|
  #     format.js
  #     format.html
  #   end
  # end

  def show_adoption_form
    @animal = Animal.new

    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    @animal = current_user.animals.new(animal_params)

    # if @animals.save
    #   redirect_to root_path, notice: @animals.animalName + " has been posted, successfully."
    # else
    #   redirect_to root_path, error: @animals.errors.full_messages.first
    # end
    # respond_to do |format|
      if @animal.save
        # format.html { redirect_to show_rating_form_path, notice: @animal.animalName + " has been posted, successfully." }
        # format.js
        # format.html { render action: "home/index", notice: @animal.animalName + " has been posted, successfully." }
        # format.json { render json: @animal, status: :created, location: @animal }
      # else
      #   format.html { render action: "new" }
      #   format.json { render json: @animal.errors, status: :unprocessable_entity }

        redirect_to root_path, notice: @animal.animalName + " has been posted, successfully."
      else
        redirect_to root_path, error: @animal.errors.full_messages.first

      end
    # end
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

    def find_like(animal)
      animal.get_likes.where(user: current_user)
    end

    def find_likeable
      @likeable_type = params[:likeable_type].classify
      @likeable = @likeable_type.constantize.find(params[:likeable_id])
    end

end
