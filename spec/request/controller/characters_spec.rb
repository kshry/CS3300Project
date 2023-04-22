RSpec.describe "/characters", type: :request do
    

    let(:valid_attributes)  {
        {name: "Guy", character_class:"Fighter", level: 12, description: "This is a fighter"}
    }
  
    let(:invalid_attributes) {
        {name: "Guy", character_class:"Fighter", level: -3, description: "This is a fighter"} }

    before do
      @user = FactoryBot.create(:user)
      sign_in @user
    end

    describe "GET /index" do
      it "renders a successful response" do
        character = Character.new(valid_attributes)
        get characters_url
        expect(response).to be_successful
      end
    end
  
    describe "GET /show" do
      it "renders a successful response" do
        character = @user.characters.create! (valid_attributes)
        get character_url(character)
        expect(response).to be_successful
      end
    end
  
    describe "GET /new" do
      it "renders a successful response" do
        get new_character_url
        expect(response).to be_successful
      end
    end
  
    describe "GET /edit" do
      it "render a successful response" do
        character = @user.characters.create! valid_attributes
        get edit_character_url(character)
        expect(response).to be_successful
      end
      
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new character" do
          character = @user.characters.create! valid_attributes
          expect {
            post characters_url, params: { character: valid_attributes }
          }.to change(Character, :count).by(1)
        end
  
        it "redirects to the created character" do
          post characters_url, params: { character: valid_attributes }
          expect(response).to redirect_to(character_url(Character.last))
        end
      end
  
      context "with invalid parameters" do
        it "does not create a new character" do
          expect {
            post characters_url, params: { character: invalid_attributes }
          }.to change(Character, :count).by(0)
        end
  
        it "does not process the character" do
          post characters_url, params: { character: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  
    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
            {name: "Gary", character_class:"Barbarian", level: 7, description: "New Description"}
        }
  
        it "updates the requested character" do
          character = @user.characters.create! valid_attributes
          patch character_url(character), params: { character: new_attributes }
          character.reload
          expect(character.name).to eq("Gary")
          expect(character.character_class).to eq("Barbarian")
          expect(character.level).to eq(7)
          expect(character.description).to eq("New Description")
        end
  
        it "redirects to the character" do
          character = @user.characters.create! valid_attributes
          patch character_url(character), params: { character: new_attributes }
          character.reload
          expect(response).to redirect_to(character_url(character))
        end
      end
      context "with invalid parameters" do
        it "to not process the character" do
          character = @user.characters.create! valid_attributes
          patch character_url(character), params: { character: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
  
    end
  
    describe "DELETE /destroy" do  
      it "destroys the requested character" do
        character = @user.characters.create! valid_attributes
        expect {
          delete character_url(character)
        }.to change(Character, :count).by(-1)
      end

      it "redirects to the characters list" do
        character = @user.characters.create! valid_attributes
        delete character_url(character)
        expect(response).to redirect_to(characters_url)
      end
    end
end