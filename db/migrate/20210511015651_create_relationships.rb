class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      # Carl (user id = 2)
      t.integer :following_id
      # Carmen (user id = 1)

      t.timestamps
    end
  end
end
