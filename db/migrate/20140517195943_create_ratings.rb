class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :votes
      t.belongs_to :content

      t.timestamps
    end
  end
end
