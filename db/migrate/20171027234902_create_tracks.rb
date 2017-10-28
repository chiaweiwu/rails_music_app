class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.integer :album_id
      t.integer :band_id
      t.string :title
      t.integer :ord
      t.boolean :track_def

      t.timestamps
    end
  end
end
