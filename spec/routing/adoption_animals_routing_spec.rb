require "rails_helper"

RSpec.describe AdoptionAnimalsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/adoptionanimals").to route_to("adoptionanimals#index")
    end

    it "routes to #new" do
      expect(:get => "/adoptionanimals/new").to route_to("adoptionanimals#new")
    end

    it "routes to #show" do
      expect(:get => "/adoptionanimals/1").to route_to("adoptionanimals#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/adoptionanimals/1/edit").to route_to("adoptionanimals#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/adoptionanimals").to route_to("adoptionanimals#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/adoptionanimals/1").to route_to("adoptionanimals#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/adoptionanimals/1").to route_to("adoptionanimals#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/adoptionanimals/1").to route_to("adoptionanimals#destroy", :id => "1")
    end

  end
end
