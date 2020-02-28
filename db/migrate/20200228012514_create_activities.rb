class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references :user, foreign_key: true
      t.references :action, polymorphic: true, index: true
      t.string :action_type

      t.timestamps
    end
  end
end
