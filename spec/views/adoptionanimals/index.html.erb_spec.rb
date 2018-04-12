require 'rails_helper'

RSpec.describe "adoptionanimals/index", type: :view do
  before(:each) do
    assign(:adoptionanimals, [
      Adoptionanimal.create!(),
      Adoptionanimal.create!()
    ])
  end

  it "renders a list of adoptionanimals" do
    render
  end
end
