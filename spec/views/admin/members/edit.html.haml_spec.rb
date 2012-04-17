require 'spec_helper'

describe "admin/members/edit" do
  before(:each) do
    @admin_member = assign(:admin_member, stub_model(Admin::Member))
  end

  it "renders the edit admin_member form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_members_path(@admin_member), :method => "post" do
    end
  end
end
