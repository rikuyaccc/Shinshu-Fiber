class CreateClassrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.string :term
      t.string :week
      t.string :teacher

      t.timestamps
    end
  end
end
