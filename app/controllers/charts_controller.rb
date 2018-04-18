class ChartsController < ApplicationController
  def index
  	@users = User.all 
  	@tickets = Ticket.all 
  	@ticket_metrics = TicketMetric.all 
  end
end
