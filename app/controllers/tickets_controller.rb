class TicketsController < ApplicationController
  before_action :set_project, only: [:new, :create, :show]
  before_action :set_ticket, only: [:show, :edit, :update]

  def new
    @ticket = @project.tickets.build
  end

  def edit
  end

  def show
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to [@ticket.project, @ticket],
                  notice: "Ticket has been updated."
    else
      flash.now[:alert] = "Ticket has not been updated."
      render :edit
    end
  end

  def create
    @ticket = @project.tickets.build(ticket_params)
    if @ticket.save
      redirect_to @ticket.project, notice: "Ticket has been created."
    else
      flash.now[:alert] = "Ticket has not been created."
      render :new
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :description)
  end
end
