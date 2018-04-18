class TicketsController < ApplicationController
  def index

  	tickets = Ticket.all

  	render json: tickets, each_serializer: TicketSerializer 

  end

  def show
  	@ticket = Ticket.find(params[:id])
  end

  def edit
  end

  private 

  def ticket_params
  	params.require(:ticket).permit(:id, :zen_id, )
  end
end
