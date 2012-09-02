class CalendarPresenter
  attr_reader :on_date, :view_context

  delegate :content_tag, to: :view_context
  delegate :capture, to: :view_context

  def initialize( date)
    @on_date = date || Date.today
  end

  def date_begin
    on_date.beginning_of_month.beginning_of_week
  end

  def date_end
    on_date.end_of_month.end_of_week
  end

  def range
    date_begin..date_end
  end

  def month_table(view_context, &block)
    @view_context = view_context
    content_tag :table, class: "calendar table table-bordered" do
      table_header +
      table_content(&block)
    end
  end

  private

  def table_header
    content_tag :thead do
      day_names.map{ |day_name| content_tag :th, day_name }.join.html_safe
    end
  end

  def table_content(&block)
    content_tag :tbody do
      weeks.map do |week|
        content_tag :tr do
          week.map do |day|
            content_tag :td, class: day_classes(day) do
              capture(day, &block)
            end
          end.join.html_safe
        end
      end.join.html_safe
    end
  end

  def day_classes(day)
    result = []
    result << 'today' if day == Date.today
    result << 'outside' if day.month != on_date.month
    result.empty? ? nil : result.join(' ')
  end

  def day_names
    one_week = (date_begin..date_begin.end_of_week).to_a
    one_week.map { |day| I18n.l(day, format: "%a") }
  end

  def weeks
    range.to_a.in_groups_of(7)
  end
end
