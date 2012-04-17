require 'spec_helper'

describe "admin/testimonials/new" do
  before(:each) do
    assign(:admin_testimonial, stub_model(Admin::Testimonial).as_new_record)
  end

  it "renders new admin_testimonial form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_testimonials_path, :method => "post" do
    end
  end
end
