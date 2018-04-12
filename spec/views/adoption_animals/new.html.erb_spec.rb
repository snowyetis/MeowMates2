require 'rails_helper'

RSpec.describe "adoption_animals/new", type: :view do
  before(:each) do
    assign(:adoption_animal, AdoptionAnimal.new())
  end

  it "renders new adoption_animal form" do
    render

    assert_select "form[action=?][method=?]", adoption_animals_path, "post" do
    end
  end
end
