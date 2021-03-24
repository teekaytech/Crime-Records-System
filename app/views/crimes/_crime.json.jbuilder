json.extract! crime, :id, :user_id, :category_id, :accuser, :accused, :unknown_others, :date, :statements, :created_at, :updated_at
json.url crime_url(crime, format: :json)
