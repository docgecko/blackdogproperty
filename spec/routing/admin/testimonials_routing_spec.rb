require "spec_helper"

describe Admin::TestimonialsController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/testimonials").should route_to("admin/testimonials#index")
    end

    it "routes to #new" do
      get("/admin/testimonials/new").should route_to("admin/testimonials#new")
    end

    it "routes to #show" do
      get("/admin/testimonials/1").should route_to("admin/testimonials#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/testimonials/1/edit").should route_to("admin/testimonials#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/testimonials").should route_to("admin/testimonials#create")
    end

    it "routes to #update" do
      put("/admin/testimonials/1").should route_to("admin/testimonials#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/testimonials/1").should route_to("admin/testimonials#destroy", :id => "1")
    end

  end
end
