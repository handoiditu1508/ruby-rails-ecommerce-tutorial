class AddUniqueIndexForRegistration < ActiveRecord::Migration[7.0]
  def change
    add_index :registrations, [:course_id, :student_id], unique: true
    #Ex:- add_index("admin_users", "username")
  end
end
