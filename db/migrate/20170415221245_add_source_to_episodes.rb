class AddSourceToEpisodes < ActiveRecord::Migration[5.0]
  def change
    add_column :episodes, :source, :string
  end
end
