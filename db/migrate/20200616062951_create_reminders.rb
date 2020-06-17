class CreateReminders < ActiveRecord::Migration[6.0]
  def change
    create_table :reminders do |t|
      t.string :title
      t.string :message
      t.string :link
      t.integer :episode, default: 1
      t.integer :chapter, default: 1
      
      t.timestamps
    end
  end
end
