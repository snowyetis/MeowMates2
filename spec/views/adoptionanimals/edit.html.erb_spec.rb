require 'rails_helper'

RSpec.describe "adoptionanimals/edit", type: :view do
  before(:each) do
    @adoptionanimal = assign(:adoptionanimal, Adoptionanimal.create!())
  end

  it "renders the edit adoptionanimal form" do
    render

    assert_select "form[action=?][method=?]", adoptionanimal_path(@adoptionanimal), "post" do
    end
  end
end
