json.extract! first_information_report, :id, :user_id, :complainant_id, :offense, :date, :location, :suspect_details, :created_at, :updated_at
json.url first_information_report_url(first_information_report, format: :json)
