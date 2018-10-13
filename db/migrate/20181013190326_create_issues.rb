class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.string :summary
      t.integer :status
      t.references :reporter
      t.references :assignee
      t.timestamps
    end
  end
end
