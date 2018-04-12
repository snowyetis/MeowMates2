require 'rails_helper'

RSpec.describe "adoption_animals/index", type: :view do
  before(:each) do
    assign(:adoption_animals, [
      AdoptionAnimal.create!(),
      AdoptionAnimal.create!()
    ])
  end

  it "renders a list of adoption_animals" do
    render
  end
end
