class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.integer :rt_id, default: 0
      t.string :rt_img_url, default: "http://d3biamo577v4eu.cloudfront.net/static/images/redesign/poster_default.gif"
      t.boolean :fresh

      t.timestamps null: false
    end
  end
end
