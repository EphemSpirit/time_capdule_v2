class Journals::TagsController < TagsController
  before_action :set_taggable

  private

    def set_taggable
      @taggable = Journal.find(params[:journal_id])
    end

end
