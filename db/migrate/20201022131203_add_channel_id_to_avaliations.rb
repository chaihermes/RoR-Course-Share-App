class AddChannelIdToAvaliations < ActiveRecord::Migration[5.1]
  def change
    add_column :avaliations, :channel_id, :integer
  end
end
