require "spec_helper"

describe Member::SubscriptionsController do
  describe "routing" do

    it "routes to #index" do
      get("/member/subscriptions").should route_to("member/subscriptions#index")
    end

    it "routes to #new" do
      get("/member/subscriptions/new").should route_to("member/subscriptions#new")
    end

    it "routes to #show" do
      get("/member/subscriptions/1").should route_to("member/subscriptions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/member/subscriptions/1/edit").should route_to("member/subscriptions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/member/subscriptions").should route_to("member/subscriptions#create")
    end

    it "routes to #update" do
      put("/member/subscriptions/1").should route_to("member/subscriptions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/member/subscriptions/1").should route_to("member/subscriptions#destroy", :id => "1")
    end

  end
end
