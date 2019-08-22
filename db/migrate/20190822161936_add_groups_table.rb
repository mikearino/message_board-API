class AddGroupsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.column :topic, :string
      t.timestamps()
    end
  end
end
