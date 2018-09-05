class CreateAssessmentSelves < ActiveRecord::Migration[5.0]
  def change
    create_table :assessment_selves do |t|
      t.references :user, foreign_key: true
      t.integer :organizationtype
      t.integer :communication
      t.integer :discussion
      t.integer :confrontation
      t.integer :trust
      t.integer :decisionmaking
      t.integer :responsibility
      t.integer :value

      t.timestamps
    end
  end
end
