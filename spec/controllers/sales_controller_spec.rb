require 'spec_helper'

describe SalesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'filter'" do
    it "returns http success" do
      get 'filter'
      response.should be_success
    end
  end

end
