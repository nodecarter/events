module Account::EventsHelper

  def recurrents
    Event::RECURRENT_TYPES.map { |rec_type| Recurrent.new(rec_type) }
  end

  class Recurrent < Struct.new(:id)
    def name
      I18n.t(id, scope: "recurrent_types")
    end
  end
end
