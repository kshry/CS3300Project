class AddUserAssociationToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_reference :characters, :user, foreign_key: true
    add_foreign_key :characters, :users
  end
end
