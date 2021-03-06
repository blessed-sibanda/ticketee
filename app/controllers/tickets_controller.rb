class TicketsController < ApplicationController
  before_action :set_project, only: [:new, :create, :show, :destroy]
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

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

  def destroy
    @ticket.destroy
    redirect_to @project, notice: "Ticket has been deleted."
  end

  def create
    @ticket = @project.tickets.build(ticket_params)
    @ticket.author = current_user
    if @ticket.save
      redirect_to [@ticket.project, @ticket],
                  notice: "Ticket has been created."
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
    params.require(:ticket).permit(:name, :description, :attachment)
  end
end
