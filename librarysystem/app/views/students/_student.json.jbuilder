json.extract! student, :id, :name, :university, :maxborrowbooks, :email, :encrypted_password, :created_at, :updated_at
json.url student_url(student, format: :json)
