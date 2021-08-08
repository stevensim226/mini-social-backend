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

  def delete
    to_be_deleted = StatusUpdate.find_by_id(params[:id])

    if to_be_deleted != nil
      to_be_deleted.destroy
    end

    render :text => ""
  end

  def update
    params.required(:status_update).permit(:name, :content, :pfp_url)
    to_be_updated = StatusUpdate.find_by_id(params[:id])

    if to_be_updated != nil
      to_be_updated.name = params[:name]
      to_be_updated.content = params[:content]
      to_be_updated.pfp_url = params.key?(:pfp_url) ? params[:pfp_url] : to_be_updated.pfp_url
      render json: build_response(to_be_updated, to_be_updated.save) and return
    end

    render json: build_response(to_be_updated, false)
  end
end
