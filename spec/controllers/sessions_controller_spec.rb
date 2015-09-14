require "rails_helper"

RSpec.describe SessionsController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
   
   describe "POST create user" do
    context "with valid attributes" do
      it "creates a new user" do
          post :create, User.attributes_for(:post, user: @user)
          response.should redirect_to root_path
      end
    
      # context "with invalid attributes" do
      #   it "does not save the new user" do
      #     expect{
      #       post :create, user: Test.attributes_for(:invalid_user)
      #     }
      #   end
      # end

    end
  end


   # describe "GET Signup" do
   #    it "assigns @user" do
   #      user = User.create
   #      get :signup
   #      expect(assigns(:users)).to eq([user])
   #    end

   #    # it "renders the index template" do
   #    #   get :index
   #    #   expect(response).to render_template("index")
   #    # end
   #  end


end



