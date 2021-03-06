class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
     t.references :answer,         null: false, foreign_key: true
     t.references :user,           null: false, foreign_key: true
     t.text :body,                 null: false
     t.timestamps                  null: false
    end
  end
end
