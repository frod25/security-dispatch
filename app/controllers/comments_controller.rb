class CommentsController < ApplicationController
    
    def index 
        @comments = Comment.all.reverse 
        render :index
    end 

    def create
        if @comment = Comment.create(comment_params)
            redirect_to dispatch_path(@comment.dispatch_id)
        else
            flash[:comment_error] = @comment.errors.full_messages
            redirect_to dispatch_path(@comment.dispatch_id)
        end
    end

    def edit 
        @comment = Comment.find(params[:id])
        @dispatch = Dispatch.find(@comment.dispatch_id)
        render :edit 
    end 

    def update 
        comment = Comment.find(params[:id])
        if current_user.id == comment.user_id
            comment.update(comment_params)
            redirect_to dispatch_path(comment.dispatch_id)
        else
            flash[:message] = "Current user cannot edit comment."
            redirect_to dispatch_path(comment.dispatch_id)
        end
    end 

    
    def destroy 
        comment = Comment.find(params[:id])
        dispatch_id = comment.dispatch_id
        comment.destroy
        redirect_to dispatch_path(dispatch_id)
    end 


    private
 
    def comment_params
         params.require(:comment).permit(:message, :user_id, :dispatch_id)
    end 
end
