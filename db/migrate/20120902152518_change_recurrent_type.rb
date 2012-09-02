class ChangeRecurrentType < ActiveRecord::Migration
  def change
    change_column :events, :recurrent, :string
  end
end
