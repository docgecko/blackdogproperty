require 'spec_helper'

describe "admin/properties/edit" do
  before(:each) do
    @admin_property = assign(:admin_property, stub_model(Admin::Property))
  end

  it "renders the edit admin_property form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_properties_path(@admin_property), :method => "post" do
    end
  end
end
