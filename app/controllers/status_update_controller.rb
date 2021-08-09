load './app/utility/json_response.rb'

class StatusUpdateController < ApplicationController
  def read
    render json: StatusUpdate.all
  end

  def read_specific
    result = StatusUpdate.where(id: params[:id])
    
    if result.any?
      status = result.take
      content = { :comments => status.get_comments }
      content.merge!(status.as_json)
    else
      content = {}
    end

    render json: JsonResponse.build_response(content, result.any?)

  end

  def create
    new_status = StatusUpdate.create(name: params[:name], content: params[:content])

    if params[:pfp_url] != ""
      new_status.pfp_url = params[:pfp_url]
    end

    if new_status.valid?
      new_status.save
    end
    
    render json: JsonResponse.build_response(new_status, new_status.valid?)
  end

  def delete
    to_be_deleted = StatusUpdate.find_by_id(params[:id])

    if to_be_deleted != nil
      to_be_deleted.destroy
    end

    render :text => ""
  end

  def update
    to_be_updated = StatusUpdate.find_by_id(params[:id])

    if to_be_updated != nil
      to_be_updated.name = params[:name]
      to_be_updated.content = params[:content]
      to_be_updated.pfp_url = params.key?(:pfp_url) ? params[:pfp_url] : to_be_updated.pfp_url
      render json: JsonResponse.build_response(to_be_updated, to_be_updated.save) and return
    end

    render json: JsonResponse.build_response(to_be_updated, false)
  end
end
