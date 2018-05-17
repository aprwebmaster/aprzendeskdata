class ChartsController < ApplicationController

	load 'edgarReplyTime.rb'
	load 'edgarFullResolution.rb'
	load 'morganReplyTime.rb'
	load 'morganFullResolution.rb'
	load 'eliseReplyTime.rb'
	load 'eliseFullResolution.rb'
	load 'raulReplyTime.rb'  
	load 'raulFullResolution.rb'
 

  def index
  	@users = User.all 
  	@tickets = Ticket.all 
  	@ticket_metrics = TicketMetric.all 

  	puts $edgarBusinessHours #edgars reply time for all Calendar Hours 
  	puts $edgarCalendarHours  #egars reply time during Business Hours 
  	
  	puts  $edgarFullResoBusinessHours 
  	puts  $edgarFullResoCalendarHours 


  	puts $morganBusinessHours
  	puts $morganCalendarHours 

  	puts $morganFullResoBusinessHours 
  	puts $morganFullResoCalendarHours 


  	puts $eliseBusinessHours 
  	puts $eliseCalendarHours 

  	puts $eliseFullResoBusinessHours 
  	puts $eliseFullResoCalendarHours 


  	puts $raulBusinessHours 
  	puts $raulCalendarHours 

  	puts $raulFullResoBusinessHours 
  	puts $raulFullResoCalendarHours 


  end


end
