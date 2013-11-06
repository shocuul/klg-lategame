require "spec_helper"

describe MasteriesController do
  describe "routing" do

    it "routes to #index" do
      get("/masteries").should route_to("masteries#index")
    end

    it "routes to #new" do
      get("/masteries/new").should route_to("masteries#new")
    end

    it "routes to #show" do
      get("/masteries/1").should route_to("masteries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/masteries/1/edit").should route_to("masteries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/masteries").should route_to("masteries#create")
    end

    it "routes to #update" do
      put("/masteries/1").should route_to("masteries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/masteries/1").should route_to("masteries#destroy", :id => "1")
    end

  end
end
