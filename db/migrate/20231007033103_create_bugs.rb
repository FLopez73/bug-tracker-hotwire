class CreateBugs < ActiveRecord::Migration[7.0]
  def change
    create_table :bugs do |t|
      t.string :description
      t.string :prority
      t.string :assignee

      t.timestamps
    end
  end
end
