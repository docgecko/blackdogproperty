require 'spec_helper'

describe "admin/properties/new" do
  before(:each) do
    assign(:admin_property, stub_model(Admin::Property).as_new_record)
  end

  it "renders new admin_property form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_properties_path, :method => "post" do
    end
  end
end
