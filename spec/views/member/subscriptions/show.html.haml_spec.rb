require 'spec_helper'

describe "member/subscriptions/show" do
  before(:each) do
    @member_subscription = assign(:member_subscription, stub_model(Member::Subscription))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
