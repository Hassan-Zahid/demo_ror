class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.integer :url_id
      t.string :type
      t.string :content

      t.timestamps
    end
  end
end
