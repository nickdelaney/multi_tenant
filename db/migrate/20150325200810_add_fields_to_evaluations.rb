class AddFieldsToEvaluations < ActiveRecord::Migration
  def change
    add_column :evaluations, :focus_letter, :string
    add_column :evaluations, :behavior, :string
    add_column :evaluations, :comment, :string
  end
end
