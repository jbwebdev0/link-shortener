class CreateShortenedLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_links do |t|
      t.text :original_url
      t.string :short_url
      t.integer :hits, default: 0

      t.timestamps
    end
  end
end
