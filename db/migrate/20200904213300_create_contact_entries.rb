class CreateContactEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_entries do |t|
      t.references :contact_list, null: false, foreign_key: true
      t.integer :contact_id

      t.timestamps
    end
  end
end
