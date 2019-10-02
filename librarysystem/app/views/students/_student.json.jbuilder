json.extract! student, :id, :name, :university, :email, :password, :maxborrowbooks, :created_at, :updated_at
json.url student_url(student, format: :json)
