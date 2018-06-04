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

    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv, filename: "users-#{Date.today}.csv" }
    end

    respond_to do |format|
      format.html
      format.csv { send_data @tickets.to_csv, filename: "tickets-#{Date.today}.csv" }
    end

    respond_to do |format|
      format.html
      format.csv { send_data @ticket_metrics.to_csv, filename: "ticket_metrics-#{Date.today}.csv" }
    end

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
