class CreateAssessmentOthers < ActiveRecord::Migration[5.0]
  def change
    create_table :assessment_others do |t|
      t.references :user, foreign_key: true
      t.references :requesteduser, foreign_key: { to_table: :users }
      t.integer :organizationtype
      t.integer :communication
      t.integer :discussion
      t.integer :confrontation
      t.integer :trust
      t.integer :decisionmaking
      t.integer :responsibility
      t.integer :value

      t.timestamps
      
      t.index [:user_id, :requesteduser_id], unique: true
    end
  end
end
