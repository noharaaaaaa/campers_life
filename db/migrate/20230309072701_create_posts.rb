class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string  :title, null: false
      t.text    :article, null: false
      t.string  :place, null: false
      t.string  :linl, null: false
      t.integer :price
      t.integer :person_id
      t.references :user, null: false
      
      t.timestamps
    end
  end
end
