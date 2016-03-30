require 'rails_helper'

RSpec.describe GabsController, type: :controller do

context "authenticated user" do
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
        context "unauglgthorized user" do
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

      describe "update" do
        context "unauthorized user" do
          let(:user_two){create(:user)}
          let(:gab){create(:gab)}
          let(:gab_two){create(:gab, user_id: user_two.id)}
          it "cannot update someone else's blogpost" do
            patch :update, id: gab, gab: {title: ""}
            expect(response).to redirect_to(root_path)
          end
        end

        context "with valid attributes" do
          let!(:gab){create(:gab, user_id: subject.current_user.id)}

          def update_gab
            patch :update, id: gab, gab: { title: "123123123"}
          end

          it "updates the attributes with the parameters" do
            update_gab
            expect(gab.reload.title).to eq("123123123")
          end

          it "redirects to user page after successful update" do
            update_gab
            expect(response).to redirect_to(gab_path(gab))
          end
        end

        context "without valid attributes" do
        let!(:gab){create(:gab, user_id: subject.current_user.id)}
        def update_invalid_gab
          patch :update, id: gab, gab: { title: ""}
        end

        it "doesn't update the record in the database" do
          update_invalid_gab
          expect(gab.reload.title).to eq(gab.title)
        end

        it "renders the edit template" do
          update_invalid_gab
          expect(response).to render_template(:edit)
        end
      end
    end

    describe "#destroy" do

      context "unauthorized user" do
        let!(:user_two){create(:user)}
        let!(:gab){create(:gab, user_id: user_two)}

        it "cannot delete another user's gab" do
          delete :destroy, id: gab
          expect(response).to redirect_to(root_path)
        end
        it "sets a flash message" do
          delete :destroy, id: gab
          expect(flash[:info]).to be
        end
      end

      context "authorized user" do
        let!(:first_gab){create(:gab, user_id: subject.current_user.id)}
        let!(:gab){create(:gab, user_id: subject.current_user.id)}

        def delete_gab
          delete :destroy, id: gab
        end

         it "removes the record from the database" do
           expect{delete_gab}.to change{Gab.count}.by(-1)
         end

         it "redirects to the index template" do
           delete_gab
           expect(response).to redirect_to(gabs_path)
         end
        end
      end
    end
  end
  context "unauthenticated user" do
    let(:gab_attributes){attributes_for(:gab)}
    let!(:gab){create(:gab)}

    def send_valid_request
      post :create, { gab: gab_attributes }
    end

    it "can't GET new gab" do
      get :new
      expect(response).to redirect_to(new_user_session_path)
    end

    it "cannot POST a gab in the database" do
      expect{send_valid_request}.to change{Gab.count}.by(0)
    end

    it "cannot view all gabs on the INDEX action" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end

    it "can view a gab on the SHOW page" do
      binding.pry
      get :show, id: gab
      expect(response).to render_template(:show)
    end
  end
end
