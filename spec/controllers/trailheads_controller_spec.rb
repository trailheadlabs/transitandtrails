require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TrailheadsController do

  # This should return the minimal set of attributes required to create a valid
  # Trailhead. As you add validations to Trailhead, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TrailheadsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all trailheads as @trailheads" do
      trailhead = Trailhead.create! valid_attributes
      get :index, {}, valid_session
      assigns(:trailheads).should eq([trailhead])
    end
  end

  describe "GET show" do
    it "assigns the requested trailhead as @trailhead" do
      trailhead = Trailhead.create! valid_attributes
      get :show, {:id => trailhead.to_param}, valid_session
      assigns(:trailhead).should eq(trailhead)
    end
  end

  context "logged in" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in :user, @user
      controller.user_signed_in?.should be_true
    end

    describe "GET new" do
      it "assigns a new trailhead as @trailhead" do
        get :new, {}, valid_session
        assigns(:trailhead).should be_a_new(Trailhead)
      end
    end

    describe "GET edit" do
      it "assigns the requested trailhead as @trailhead" do
        trailhead = Trailhead.create! valid_attributes
        get :edit, {:id => trailhead.to_param}, valid_session
        assigns(:trailhead).should eq(trailhead)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Trailhead" do
          expect {
            post :create, {:trailhead => valid_attributes}, valid_session
          }.to change(Trailhead, :count).by(1)
        end

        it "assigns a newly created trailhead as @trailhead" do
          post :create, {:trailhead => valid_attributes}, valid_session
          assigns(:trailhead).should be_a(Trailhead)
          assigns(:trailhead).should be_persisted
        end

        it "redirects to the created trailhead" do
          post :create, {:trailhead => valid_attributes}, valid_session
          response.should redirect_to(Trailhead.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved trailhead as @trailhead" do
          # Trigger the behavior that occurs when invalid params are submitted
          Trailhead.any_instance.stub(:save).and_return(false)
          post :create, {:trailhead => {}}, valid_session
          assigns(:trailhead).should be_a_new(Trailhead)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Trailhead.any_instance.stub(:save).and_return(false)
          post :create, {:trailhead => {}}, valid_session
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested trailhead" do
          trailhead = Trailhead.create! valid_attributes
          # Assuming there are no other trailheads in the database, this
          # specifies that the Trailhead created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Trailhead.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, {:id => trailhead.to_param, :trailhead => {'these' => 'params'}}, valid_session
        end

        it "assigns the requested trailhead as @trailhead" do
          trailhead = Trailhead.create! valid_attributes
          put :update, {:id => trailhead.to_param, :trailhead => valid_attributes}, valid_session
          assigns(:trailhead).should eq(trailhead)
        end

        it "redirects to the trailhead" do
          trailhead = Trailhead.create! valid_attributes
          put :update, {:id => trailhead.to_param, :trailhead => valid_attributes}, valid_session
          response.should redirect_to(trailhead)
        end
      end

      describe "with invalid params" do
        it "assigns the trailhead as @trailhead" do
          trailhead = Trailhead.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Trailhead.any_instance.stub(:save).and_return(false)
          put :update, {:id => trailhead.to_param, :trailhead => {}}, valid_session
          assigns(:trailhead).should eq(trailhead)
        end

        it "re-renders the 'edit' template" do
          trailhead = Trailhead.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Trailhead.any_instance.stub(:save).and_return(false)
          put :update, {:id => trailhead.to_param, :trailhead => {}}, valid_session
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested trailhead" do
        trailhead = Trailhead.create! valid_attributes
        expect {
          delete :destroy, {:id => trailhead.to_param}, valid_session
        }.to change(Trailhead, :count).by(-1)
      end

      it "redirects to the trailheads list" do
        trailhead = Trailhead.create! valid_attributes
        delete :destroy, {:id => trailhead.to_param}, valid_session
        response.should redirect_to(trailheads_url)
      end
    end
  end
end
