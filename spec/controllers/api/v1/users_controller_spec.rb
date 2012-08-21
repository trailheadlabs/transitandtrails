require "spec_helper"

describe API::V1::UsersController do
  render_views

  describe "GET index" do
    it "returns a list of users" do
      FactoryGirl.create(:user)
      get :index
      response.status.should eq 200
      list = JSON.parse(response.body)
    end
  end

  describe "GET show" do
    it "returns a user" do
      user = FactoryGirl.create(:user)
      user_profile = FactoryGirl.create(:user_profile,:user=>user)
      get :show, {:id=>user.id}
      response.status.should eq 200
      object = JSON.parse(response.body)
      object['username'].should eq user.username
      object['first_name'].should eq user.user_profile.firstname
      object['last_name'].should eq user.user_profile.lastname
      object['avatar_url'].should eq user_profile.avatar.url
      object['avatar_thumbnail_url'].should eq user_profile.avatar.thumbnail.url
    end
  end
end


