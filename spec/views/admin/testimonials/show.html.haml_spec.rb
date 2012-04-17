require 'spec_helper'

describe "admin/testimonials/show" do
  before(:each) do
    @admin_testimonial = assign(:admin_testimonial, stub_model(Admin::Testimonial))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
