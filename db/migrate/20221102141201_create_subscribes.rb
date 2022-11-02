class CreateSubscribes < ActiveRecord::Migration[6.1]
  def change
    create_table :subscribes do |t|
      t.references :singer, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
