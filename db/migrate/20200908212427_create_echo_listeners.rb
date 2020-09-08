class CreateEchoListeners < ActiveRecord::Migration[6.0]
  def change
    create_table :echo_listeners do |t|
      t.references :echo, null: false, foreign_key: true
      t.bigint :listener_id

      t.timestamps
    end
  end
end
