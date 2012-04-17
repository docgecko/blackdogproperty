require 'spec_helper'

describe "admin/members/index" do
  before(:each) do
    assign(:admin_members, [
      stub_model(Admin::Member),
      stub_model(Admin::Member)
    ])
  end

  it "renders a list of admin/members" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
