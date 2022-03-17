class CreateRepositories < ActiveRecord::Migration[6.1]
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :full_name
      t.string :technology
      t.string :category
      t.jsonb :external_info

      t.timestamps
    end

    add_index :repositories, [:full_name], unique: true
    add_index :repositories, [:name], unique: true
    add_index :repositories, [:technology, :category, :name]
  end
end
