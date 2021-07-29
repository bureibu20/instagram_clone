class AddContentToFeeds < ActiveRecord::Migration[6.1]
  def change
    add_column :feeds, :content, :string
  end
end
