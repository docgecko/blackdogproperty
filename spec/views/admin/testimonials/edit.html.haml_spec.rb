require 'spec_helper'

describe "admin/testimonials/edit" do
  before(:each) do
    @admin_testimonial = assign(:admin_testimonial, stub_model(Admin::Testimonial))
  end

  it "renders the edit admin_testimonial form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_testimonials_path(@admin_testimonial), :method => "post" do
    end
  end
end
