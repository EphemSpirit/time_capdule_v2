class JournalsController < ApplicationController
  before_action :find_journal, only: [:show, :edit, :update, :destroy]

  def index
    @journals = current_user.entries
  end

  def new
    @journal = current_user.entries.build
  end

  def create
    @journal = current_user.entries.build(journal_params)

    if @journal.save
      redirect_to @journal
      flash[:notice] = "Add tags to make this entry searchable!"
    else
      render 'new'
      flash[:notice] = "Something went wrong"
    end
  end


  def show
  end

  def edit
  end

  def update
    @journal.update(journal_params)
    redirect_to my_dashboard_path
  end


  def destroy
    @journal.destroy
    flash[:notice] = "Entry successfully deleted"
    redirect_to my_entries_path
  end

  private

    def find_journal
      @journal = Journal.find(params[:id])
    end

    def journal_params
      params.require(:journal).permit(:title, :body)
    end

    # def permitted_params
    #   params.require(:journal).permit(:title, :body, tags: [])
    # end
    #
    # def tags
    #   permitted_params.slice(:tags)
    # end

end
