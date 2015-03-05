class CreateCandies < ActiveRecord::Migration
  def change
    create_table :candies do |t|
      t.string :name
      t.integer :size
      t.integer :pieces
      t.integer :bucket_id, references: :buckets
      t.integer :house_id, references: :houses
    end
  end
end