load './app/utility/json_response.rb'

class CommentController < ApplicationController
  def create
    status_pointed = StatusUpdate.find(params[:status_id])

    if status_pointed != nil
      status_pointed.comment.create(content: params[:content])
    end

    render json: JsonResponse.build_response({:content => params[:content]}, status_pointed != nil)
  end

  def delete
    to_be_deleted = Comment.find_by_id(params[:comment_id])

    if to_be_deleted != nil
      to_be_deleted.destroy
    end

    render :text => ""
  end
end
