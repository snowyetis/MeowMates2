require 'rails_helper'

RSpec.describe "AdoptionAnimals", type: :request do
  describe "GET /adoptionanimals" do
    it "works! (now write some real specs)" do
      get adoptionanimals_path
      expect(response).to have_http_status(200)
    end
  end
end
