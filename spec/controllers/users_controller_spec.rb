RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) {
    {
      email: "andrew@ekohe.com",
      password: "password",
      password_confirmation: "password",
      active: true,
      approved: true,
      confirmed: true
    }
  }

  let(:invalid_attributes) {
    {
      email: "andrew@ekohe.com",
      password: "password",
      password_confirmation: "password123",
      active: true,
      approved: true,
      confirmed: true
    }
  }

  describe "GET #index" do

    it { should route(:get, "/users").to(action: :index) }

    it "assigns all users as @users" do
      user = User.create!(valid_attributes)
      get :index
      expect(assigns(:users)).to eq([user])
    end
  end

  describe "GET #new" do
    it { should route(:get, "/users/new").to(action: :new) }

    it "assigns a new user as @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, {:user => valid_attributes}
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created users as @users" do
        post :create, {:user => valid_attributes}
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it "redirects to the created users" do
        post :create, {:user => valid_attributes}
        expect(response).to redirect_to(User.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved users as @users" do
        post :create, {:user => invalid_attributes}
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        post :create, {:user => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end
  describe "GET #search" do

    it { should route(:get, "/users/search").to(action: :search) }

    it "assigns filted users as @users" do
      user = User.create!(valid_attributes)
      @request.accept = "text/javascript"
      get :search, {q: 'andrew'}
      expect(assigns(:users)).to eq([user])
    end
  end
end
