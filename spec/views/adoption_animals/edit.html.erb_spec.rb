require 'rails_helper'

RSpec.describe "adoption_animals/edit", type: :view do
  before(:each) do
    @adoption_animal = assign(:adoption_animal, AdoptionAnimal.create!())
  end

  it "renders the edit adoption_animal form" do
    render

    assert_select "form[action=?][method=?]", adoption_animal_path(@adoption_animal), "post" do
    end
  end
end
