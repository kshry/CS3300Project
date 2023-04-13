
require "rails_helper"

describe "character Attribute Requirements on Create", :type => :model do
    let(:valid_attributes)  {{name: "Guy", character_class:"Fighter", level: 12, description: "This is a fighter"}}
    let(:missing_name) {{character_class:"Fighter", level: 12, description: "This is a fighter"}}
    let(:missing_class) {{name: "Guy", level: 12, description: "This is a fighter"}}
    let(:invalid_level) {{name: "Guy", character_class:"Fighter", level: -3, description: "This is a fighter"}}
    let(:missing_level) {{name: "Guy", character_class:"Fighter", description: "This is a fighter"}}
    let(:empty_description) {{name: "Guy", character_class:"Fighter", level: 12}}
  context "validation tests" do
    it "ensures the name is present when creating character" do
      character = Character.new(missing_name)
      expect(character.valid?).to eq(false)
    end
    it "should not be able to save character when class missing" do
      character = Character.new(missing_class)
      expect(character.save).to eq(false)
    end
    it "should not be able to save character when level below 0" do
        character = Character.new(invalid_level)
        expect(character.save).to eq(false)
      end
    it "should not be able to save character without a level" do
        character = Character.new(missing_level)
        expect(character.save).to eq(false)
      end
    it "should be able to save character with name, title, level, but no description" do
        character = Character.new(empty_description)
        expect(character.save).to eq(true)
      end
    it "should be able to save character with name, title, level, and description" do
      character = Character.new(valid_attributes)
      expect(character.save).to eq(true)
    end
  end
end


describe "character Attribute Requirements on Edit", :type => :model do
    let(:valid_attributes)  {{name: "Guy", character_class:"Fighter", level: 12, description: "This is a fighter"}}
  context "Edit character" do  
    before (:each) do
      @character = Character.create(valid_attributes)
 
      end
    it "ensures the name is present when editing character" do
      @character.update(:name => "Gary")
      expect(@character.name == "Gary")
    end
    it "ensures the class is present when editing character" do
        @character.update(:character_class => "Barbarian")
        expect(@character.character_class == "Barbarian")
    end
    it "ensures the level is present when editing character" do
        @character.update(:level => 7)
        expect(@character.level == 7)
    end
    it "ensures the description is present when editing character" do
        @character.update(:description => "New description")
        expect(@character.description == "New description")
    end
  end
end

