class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.string :url
      t.string :type
      t.text :quote_text
      t.string :quote_author
      t.boolean :expert_video # set to true if video is an expert video
      t.belongs_to :problem
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
