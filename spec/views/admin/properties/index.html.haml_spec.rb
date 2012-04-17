require 'spec_helper'

describe "admin/properties/index" do
  before(:each) do
    assign(:admin_properties, [
      stub_model(Admin::Property),
      stub_model(Admin::Property)
    ])
  end

  it "renders a list of admin/properties" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
