require 'spec_helper'

describe "member/subscriptions/index" do
  before(:each) do
    assign(:member_subscriptions, [
      stub_model(Member::Subscription),
      stub_model(Member::Subscription)
    ])
  end

  it "renders a list of member/subscriptions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
