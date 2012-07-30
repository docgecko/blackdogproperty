require 'spec_helper'

describe "member/subscriptions/edit" do
  before(:each) do
    @member_subscription = assign(:member_subscription, stub_model(Member::Subscription))
  end

  it "renders the edit member_subscription form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => member_subscriptions_path(@member_subscription), :method => "post" do
    end
  end
end
