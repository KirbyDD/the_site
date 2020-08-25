class CreateSecurityQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :security_questions do |t|
      t.string :question
      t.string :answer
      t.references :user, null: false, foreign_key: true
    end
  end
end
