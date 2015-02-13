class AddColumnToEvaluation < ActiveRecord::Migration
  def change
    add_column :evaluations, :picture_uploaded_at, :datetime
  end
end
