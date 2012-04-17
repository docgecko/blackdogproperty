require 'spec_helper'

describe "admin/properties/show" do
  before(:each) do
    @admin_property = assign(:admin_property, stub_model(Admin::Property))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
