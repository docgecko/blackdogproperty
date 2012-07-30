require 'spec_helper'

describe "member/subscriptions/new" do
  before(:each) do
    assign(:member_subscription, stub_model(Member::Subscription).as_new_record)
  end

  it "renders new member_subscription form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => member_subscriptions_path, :method => "post" do
    end
  end
end
