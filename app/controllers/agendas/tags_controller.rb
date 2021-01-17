class Agendas::TagsController < TagsController
  before_action :set_taggable

  private

    def set_taggable
      @taggable = Agenda.find(params[:agenda_id])
    end

end
