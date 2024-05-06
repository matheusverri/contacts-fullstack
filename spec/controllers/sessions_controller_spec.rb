require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "POST #create" do
    context "with valid credentials" do
      let!(:user) { User.create(email: "test@example.com", password: "password") }

      it "sets the user_id in session" do
        post :create, params: { email: user.email, password: user.password }
        expect(session[:user_id]).to eq(user.id)
      end

      it "redirects to root_url" do
        post :create, params: { email: user.email, password: user.password }
        expect(response).to redirect_to(root_url)
      end

      it "sets a success notice" do
        post :create, params: { email: user.email, password: user.password }
        expect(flash[:notice]).to eq("Logado com sucesso!")
      end
    end

    context "with invalid credentials" do
      it "sets an alert flash message" do
        post :create, params: { email: "invalid@example.com", password: "password" }
        expect(flash[:alert]).to eq("Email ou senha inválidos")
      end

      it "renders the new template" do
        post :create, params: { email: "invalid@example.com", password: "password" }
        expect(response).to render_template(:new)
      end
    end
  end
end
