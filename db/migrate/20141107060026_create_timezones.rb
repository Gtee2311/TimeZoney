class CreateTimezones < ActiveRecord::Migration
  def change
    create_table :timezones do |t|
      t.string :user_id
      t.string :integer
      t.string :time_zone

      t.timestamps
    end
  end
end
