class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :code
      t.string :name
      t.string :subject
      t.references :instructor, foreign_key: true

      t.timestamps
    end
  end
end
