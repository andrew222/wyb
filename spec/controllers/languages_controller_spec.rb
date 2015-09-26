RSpec.describe LanguagesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Language. As you add validations to Language, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      name: "english",
      experience: 1,
      mother_language: false
    }
  }

  let(:current_user){
    User.create!({
      email: "andrew@ekohe.com",
      password: "password",
      password_confirmation: "password"
    })
  }

  let(:invalid_attributes) {
    {
      name: "",
      experience: 1,
      mother_language: false
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LanguagesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before { allow(controller).to receive(:current_user) { current_user } }

  describe "GET #index" do

    it { should route(:get, "/languages").to(action: :index) }

    it "assigns all languages as @languages" do
      language = Language.new(valid_attributes)
      current_user.languages << language
      get :index, {}, valid_session
      expect(assigns(:languages)).to eq([language])
    end
  end

  describe "GET #show" do
    it "assigns the requested language as @language" do
      language = Language.create! valid_attributes
      get :show, {:id => language.to_param}, valid_session
      expect(assigns(:language)).to eq(language)
    end
  end

  describe "GET #new" do
    it { should route(:get, "/languages/new").to(action: :new) }

    it "assigns a new language as @language" do
      get :new, {}, valid_session
      expect(assigns(:language)).to be_a_new(Language)
    end
  end

  describe "GET #edit" do
    it "assigns the requested language as @language" do
      language = Language.create! valid_attributes
      get :edit, {:id => language.to_param}, valid_session
      expect(assigns(:language)).to eq(language)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Language" do
        expect {
          post :create, {:language => valid_attributes}, valid_session
        }.to change(Language, :count).by(1)
      end

      it "assigns a newly created languages as @languages" do
        post :create, {:language => valid_attributes}, valid_session
        expect(assigns(:language)).to be_a(Language)
        expect(assigns(:language)).to be_persisted
      end

      it "redirects to the created languages" do
        post :create, {:languages => valid_attributes}, valid_session
        expect(response).to redirect_to(Language.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved languages as @languages" do
        post :create, {:language => invalid_attributes}, valid_session
        expect(assigns(:language)).to be_a_new(Language)
      end

      it "re-renders the 'new' template" do
        post :create, {:language => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested language" do
        language = Language.create! valid_attributes
        put :update, {:id => language.to_param, :language => new_attributes}, valid_session
        language.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested language as @language" do
        language = Language.create! valid_attributes
        put :update, {:id => language.to_param, :language => valid_attributes}, valid_session
        expect(assigns(:language)).to eq(language)
      end

      it "redirects to the language" do
        language = Language.create! valid_attributes
        put :update, {:id => language.to_param, :language => valid_attributes}, valid_session
        expect(response).to redirect_to(language)
      end
    end

    context "with invalid params" do
      it "assigns the language as @language" do
        language = Language.create! valid_attributes
        put :update, {:id => language.to_param, :language => invalid_attributes}, valid_session
        expect(assigns(:language)).to eq(language)
      end

      it "re-renders the 'edit' template" do
        language = Language.create! valid_attributes
        put :update, {:id => language.to_param, :language => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested language" do
      language = Language.create! valid_attributes
      expect {
        delete :destroy, {:id => language.to_param}, valid_session
      }.to change(Language, :count).by(-1)
    end

    it "redirects to the languagess list" do
      language = Language.create! valid_attributes
      delete :destroy, {:id => language.to_param}, valid_session
      expect(response).to redirect_to(languagess_url)
    end
  end

end
