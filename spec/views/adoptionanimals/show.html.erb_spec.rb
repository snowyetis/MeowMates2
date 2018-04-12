require 'rails_helper'

RSpec.describe "adoptionanimals/show", type: :view do
  before(:each) do
    @adoptionanimal = assign(:adoptionanimal, Adoptionanimal.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
