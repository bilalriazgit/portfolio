class AddTypeToSummary < ActiveRecord::Migration[7.0]
  def change
    add_column :summaries, :stype, :integer, default: 0
  end
end
