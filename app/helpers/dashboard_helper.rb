module DashboardHelper
  def all_firs(firs)
    content_tag :tbody do
      firs.each_with_index do |fir, _index|
        concat(content_tag(:tr) do
          concat(content_tag(:td, fir.offense))
          concat(content_tag(:td, format_time(fir.date, :long, 'N/A')))
          concat(content_tag(:td, class: 'status-col') do
            content_tag(:span, '', class: "status #{fir.status}") + fir.status
          end)
          if current_user.admin?
            concat(content_tag(:td,
                               link_to(update_message(fir.status), get_link_type(fir),
                                       method: :post, class: "btn btn-#{update_link_class(fir.status)} d-block")))
          else
            concat(content_tag(:td, 'N/A', class: 'd-block'))
          end
        end)
      end
    end
  end

  def update_message(status)
    status.eql?('approved') ? 'Reject' : 'Approve'
  end

  def get_link_type(fir)
    update_message(fir.status).eql?('Approve') ? approve_fir_path(fir) : reject_fir_path(fir)
  end

  def update_link_class(status)
    status.eql?('approved') ? 'danger' : 'success'
  end

  def all_crimes(crimes)
    content_tag(:div) do
      crimes.each_with_index do |crime, _index|
        concat(content_tag(:div, class: 'customers__card-body') do
          concat(content_tag(:div, class: 'customer') do
            concat(content_tag(:div, class: 'info') do
              concat(image_tag(asset_path('npf.png'), width: '30px', height: '30px', alt: 'icon'))
              concat(content_tag(:div) do
                concat(content_tag(:h4, crime.statements.to_s))
                concat(
                  content_tag(
                    :small,
                    "#{crime.accuser} (#{format_time(crime.created_at, :short, 'N/A')})"
                  )
                )
              end)
            end)
            concat(content_tag(:div, class: 'contact') do
              concat(link_to('view', crime, class: 'btn btn-dark'))
            end)
          end)
        end)
      end
    end
  end
end
