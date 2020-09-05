class CreateUserListeners < ActiveRecord::Migration[6.0]
  def change
    create_table :user_listeners do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :listener_id

      t.timestamps
    end
  end
end
