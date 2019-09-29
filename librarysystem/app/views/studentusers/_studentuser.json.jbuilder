json.extract! studentuser, :id, :name, :email, :university, :maxborrowdays, :created_at, :updated_at
json.url studentuser_url(studentuser, format: :json)
