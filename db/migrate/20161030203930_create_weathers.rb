class CreateWeathers < ActiveRecord::Migration[5.0]
  def change
    create_table :weathers do |t|
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
