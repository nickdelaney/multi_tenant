class AddColumnsToEvaluations < ActiveRecord::Migration
  def change
    add_column :evaluations, :picture_file_name, :string
    add_column :evaluations, :picture_content_type, :string
    add_column :evaluations, :picture_file_size, :integer
  end
end
