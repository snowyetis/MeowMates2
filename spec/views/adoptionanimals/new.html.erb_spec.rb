require 'rails_helper'

RSpec.describe "adoptionanimals/new", type: :view do
  before(:each) do
    assign(:adoptionanimal, Adoptionanimal.new())
  end

  it "renders new adoptionanimal form" do
    render

    assert_select "form[action=?][method=?]", adoptionanimals_path, "post" do
    end
  end
end
