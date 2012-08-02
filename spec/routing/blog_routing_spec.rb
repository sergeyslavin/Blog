require 'spec_helper'

describe AdminsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/admins" }.should route_to(:controller => "admins", :action => "index")
    end

    it "recognizes and generates #create" do
      { :post => "/admins" }.should route_to(:controller => "admins", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/admins/1" }.should route_to(:controller => "admins", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/admins/1" }.should route_to(:controller => "admins", :action => "destroy", :id => "1")
    end

     it "recognizes and generates #edit comment" do
      { :get => "/admins/edit/comment/1" }.should route_to(:controller => "admins", :action => "edit_comment", :id => "1")
    end

    it "recognizes and generates #update comment" do
      { :get => "/admins/update/comment/1" }.should route_to(:controller => "admins", :action => "update_comment", :id => "1")
    end

    it "recognizes and generates #search" do
      { :get => "/admins/search" }.should route_to(:controller => "admins", :action => "search")
    end

  end
end

describe CommentsController do
  describe "routing" do
     it "recognizes and generates home#search" do
      { :get => "/search" }.should route_to(:controller => "comments", :action => "search")
    end
 end
end
