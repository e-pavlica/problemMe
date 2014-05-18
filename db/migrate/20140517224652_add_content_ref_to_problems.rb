class AddContentRefToProblems < ActiveRecord::Migration
  def change
    add_reference :problems, :content, index: true
  end
end
