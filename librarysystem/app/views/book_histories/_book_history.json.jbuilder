json.extract! book_history, :id, :borrow_date, :created_at, :updated_at
json.url book_history_url(book_history, format: :json)
