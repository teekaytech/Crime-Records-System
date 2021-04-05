module DashboardHelper
  def all_firs(firs)
    content_tag :tbody do
      firs.collect do |fir|
        concat(content_tag(:tr) do
          concat(content_tag(:td, fir.offense))
          concat(content_tag(:td, format_time(fir.date, :long, 'N/A')))
          concat(content_tag(:td, class: 'status-col') do
            content_tag(:span, '', class: "status #{fir.status}") + fir.status
          end)
          concat(content_tag(:td, link_to(update_message(fir.status), dashboard_index_path, class: "btn btn-#{update_link_class(fir.status)} d-block")))
        end)
      end
    end
  end

  def update_message(status)
    status.eql?('approved') ? 'Reject' : 'Approve'
  end

  def update_link_class(status)
    status.eql?('approved') ? 'danger' : 'success'
  end
end
