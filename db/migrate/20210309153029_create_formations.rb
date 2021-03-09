class CreateFormations < ActiveRecord::Migration[6.1]
  def change
    create_table :formations do |t|
      t.string :title
      t.text :content
      t.references :teacher, index: true

      t.timestamps
    end
  end
end
