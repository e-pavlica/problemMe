class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :video_url
      t.belongs_to :problem
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
