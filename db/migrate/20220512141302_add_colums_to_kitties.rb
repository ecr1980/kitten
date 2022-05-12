class AddColumsToKitties < ActiveRecord::Migration[7.0]
  def change
    add_column :kitties, :name, :string
    add_column :kitties, :age, :integer
    add_column :kitties, :cuteness, :integer
    add_column :kitties, :softness, :integer
  end
end
