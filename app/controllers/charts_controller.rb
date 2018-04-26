class ChartsController < ApplicationController

	load 'edgarReplyTime.rb'
	load 'morganReplyTime.rb'
	load 'eliseReplyTime.rb'
	load 'raulReplyTime.rb'  

  def index
  	@users = User.all 
  	@tickets = Ticket.all 
  	@ticket_metrics = TicketMetric.all 

  	puts $edgarBusinessHours #edgars reply time for all Calendar Hours 
  	puts $edgarCalendarHours  #egars reply time during Business Hours 
  	
  	puts $morganBusinessHours
  	puts $morganCalendarHours 

  	puts $eliseBusinessHours 
  	puts $eliseCalendarHours 

  	puts $raulBusinessHours 
  	puts $raulCalendarHours 

  end


end
