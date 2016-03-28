require 'rails_helper'

RSpec.describe GabsController, type: :controller do

  login_user

  describe "gabs" do

    describe "#new" do

      it "requires a current_user to render" do
        # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
        expect(subject.current_user).to_not eq(nil)
      end

      it "renders the new page" do
        get :new
        expect(response).to render_template(:new)
      end

      it "assigns a gab as a new instantiation" do
        get :new
        expect(assigns(:gab)).to be_a_new(Gab)
      end
    end

    describe "#create" do

      context "with valid parameters" do

        let(:gab_attributes){attributes_for(:gab)}

        def send_valid_request
          post :create, { gab: gab_attributes }
        end

        it "creates a gab record in the database" do
          expect{send_valid_request}.to change{Gab.count}.by(1)
        end

        it "associates the gab with the current user" do
          send_valid_request
          expect(Gab.last.user_id).to eq(subject.current_user.id)
        end

        it "redirects to the gab's page" do
          send_valid_request
          expect(response).to redirect_to(gab_path(Gab.last))
        end
      end

      context "with invalid parameters" do

        def send_invalid_request
            post :create, gab: attributes_for(:gab, {title: nil} )
        end

        it "doesn't add a record to the database" do
          expect{send_invalid_request}.to_not change{Gab.count}
        end

        it "re-renders the new template" do
          send_invalid_request
          expect(response).to render_template(:new)
        end
      end
    end

    describe "#edit" do
      context "unauglg
      thorized user" do
        let(:user_two){create(:user)}
        let(:gab_two){create(:gab, user_id: user_two)}

        it "cannot edit another's gab" do
              get :edit, id: gab_two
              expect(response).to redirect_to(root_path)
        end
      end
      context "authorized user" do
        let!(:gab){create(:gab, user_id: subject.current_user.id)}

        it "renders the edit page upon request" do
          get :edit, id: gab
          expect(response).to render_template(:edit)
        end
      end
    end
  end
end
