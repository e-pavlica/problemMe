class RemoveQuotesFromContents < ActiveRecord::Migration
  def change
    remove_columns(:contents, :quote_text, :quote_author, :expert_video, :type)
  end
end
