json.extract! complainant, :id, :user_id, :surname, :firstname, :dob, :nationality, :address, :occupation, :phone, :gender, :criminal, :created_at, :updated_at
json.url complainant_url(complainant, format: :json)
