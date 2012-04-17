require "spec_helper"

describe Admin::MembersController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/members").should route_to("admin/members#index")
    end

    it "routes to #new" do
      get("/admin/members/new").should route_to("admin/members#new")
    end

    it "routes to #show" do
      get("/admin/members/1").should route_to("admin/members#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/members/1/edit").should route_to("admin/members#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/members").should route_to("admin/members#create")
    end

    it "routes to #update" do
      put("/admin/members/1").should route_to("admin/members#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/members/1").should route_to("admin/members#destroy", :id => "1")
    end

  end
end
