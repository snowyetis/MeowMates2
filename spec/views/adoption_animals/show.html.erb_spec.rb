require 'rails_helper'

RSpec.describe "adoption_animals/show", type: :view do
  before(:each) do
    @adoption_animal = assign(:adoption_animal, AdoptionAnimal.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
