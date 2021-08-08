load './app/utility/json_response.rb'

class StatusUpdateController < ApplicationController
  def read
    render json: StatusUpdate.all
  end

  def read_specific
    result = StatusUpdate.where(id: params[:id])
    
    if result.any?
      content = StatusUpdate.where(id: params[:id]).take
    else
      content = {}
    end

    render json: build_response(content, result.any?)

  end

  def create
    new_status = StatusUpdate.create(name: params[:name], content: params[:content])

    if new_status.valid?
      new_status.save
    end
    
    render json: build_response(new_status, new_status.valid?)
  end
end
