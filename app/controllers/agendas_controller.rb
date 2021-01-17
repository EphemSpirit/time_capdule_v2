class AgendasController < ApplicationController
  before_action :find_agenda, except: [:index, :new, :create]

  def index
    @agendas = current_user.agendas.all
  end

  def new
    @agenda = current_user.agendas.build
  end

  def create
    @agenda = current_user.agendas.build(agenda_params)

    if @agenda.save
      flash[:notice] = "New agenda saved!"
      redirect_to agendas_path
    else
      flash[:notice] = "Something went wrong"
      render :new
    end
  end

  def edit
  end

  def update
    @agenda.update(agenda_params)
    redirect_to agendas_path
  end

  def destroy
    @agenda.destroy
    flash[:notice] = "Agenda deleted"
    redirect_to agendas_path
  end

  private

    def find_agenda
      @agenda = Agenda.find(params[:id])
    end

    def agenda_params
      params.require(:agenda).permit(:title, :body, :tags)
    end

end
