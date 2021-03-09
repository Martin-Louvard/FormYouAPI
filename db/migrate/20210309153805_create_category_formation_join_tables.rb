class CreateCategoryFormationJoinTables < ActiveRecord::Migration[6.1]
  def change
    create_table :category_formation_join_tables do |t|
      t.references :category, index: true
      t.references :formation, index: true
      t.timestamps
    end
  end
end
