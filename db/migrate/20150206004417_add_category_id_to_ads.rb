class AddCategoryIdToAds < ActiveRecord::Migration
  def change
    change_table :ads do |t|
      t.integer :category_id
    end
  end
end
