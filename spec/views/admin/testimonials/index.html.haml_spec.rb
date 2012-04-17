require 'spec_helper'

describe "admin/testimonials/index" do
  before(:each) do
    assign(:admin_testimonials, [
      stub_model(Admin::Testimonial),
      stub_model(Admin::Testimonial)
    ])
  end

  it "renders a list of admin/testimonials" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
