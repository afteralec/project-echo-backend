class CreateEchos < ActiveRecord::Migration[6.0]
  def change
    create_table :echos do |t|
      t.bigint :user_id
      t.string :message

      t.timestamps
    end
  end
end
