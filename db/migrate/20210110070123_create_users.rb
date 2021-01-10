class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :content
      t.string :string
      t.date :start
      t.date :end
      t.boolean :allday
      t.string :notes

      t.timestamps
    end
  end
end
