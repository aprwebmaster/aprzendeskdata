class TicketMetricsController < ApplicationController
  def index

  	ticket_metrics = TicketMetric.all

  	render json: ticket_metrics, each_serializer: TicketMetricSerializer 

  end

  def show
  	@ticket_metric = TicketMetric.find(params[:id])
  end

  def edit
  end

  private 

  def ticket_params
  	params.require(:ticket_metrics).permit(:id, :zen_id, )
  end
end
