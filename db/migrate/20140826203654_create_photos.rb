class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :author
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
