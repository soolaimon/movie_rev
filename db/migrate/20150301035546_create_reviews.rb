class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.integer :rt_id
      t.string :rt_poster_profile
      t.string :rt_poster_thumb
      t.boolean :fresh

      t.timestamps null: false
    end
  end
end
