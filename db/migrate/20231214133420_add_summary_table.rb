class AddSummaryTable < ActiveRecord::Migration[7.0]
  def change
    create_table :summaries do |t|
      t.text :description, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.integer :stype, default: 0
    end
  end
end
