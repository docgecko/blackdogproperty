require 'spec_helper'

describe "admin/members/new" do
  before(:each) do
    assign(:admin_member, stub_model(Admin::Member).as_new_record)
  end

  it "renders new admin_member form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_members_path, :method => "post" do
    end
  end
end
