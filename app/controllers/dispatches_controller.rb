class DispatchesController < ApplicationController

    def index
        @dispatches = Dispatch.best_scores
        render :index
    end
    
    def show
        @dispatch = get_dispatch
        @comment = Comment.new
        @user = @dispatch.user
        render :show
    end

    def new
        @dispatch = Dispatch.new
        render :new
    end

    def create
        dispatch = Dispatch.new(dispatch_params)
        dispatch.full_url
        dispatch.save
        if dispatch
            redirect_to dispatch_path(dispatch)
        else
            flash[:errors] = dispatch.errors.full_messages
            render :new 
        end
    end

    def edit
        @dispatch = get_dispatch
        render :edit
    end

    def update
        dispatch = get_dispatch
        if current_user.id == dispatch.user_id
            dispatch.assign_attributes(dispatch_params)
            dispatch.full_url
            dispatch.save
            redirect_to dispatch_path(dispatch)
        else
            flash[:message] = "Current user cannot edit dispatch."
            redirect_to dispatch_path(dispatch)
        end
    end

    def destroy
        get_dispatch.destroy
        redirect_to root_path
    end

    def upvote
        dispatch = get_dispatch
        if current_user.upvoted?(dispatch)
            current_user.remove_vote(dispatch)
        elsif current_user.downvoted?(dispatch)
            current_user.remove_vote(dispatch)
            current_user.upvote(dispatch)
        else
            current_user.upvote(dispatch)
        end
        dispatch.calc_score
        redirect_to root_path
    end

    def downvote
        dispatch = get_dispatch
        if current_user.downvoted?(dispatch)
            current_user.remove_vote(dispatch)
        elsif current_user.upvoted?(dispatch)
            current_user.remove_vote(dispatch)
            current_user.downvote(dispatch)
        else
            current_user.downvote(dispatch)
        end
        dispatch.calc_score
        redirect_to root_path
    end
    
    private
    def dispatch_params
        params.require(:dispatch).permit(:title, :description, :url, :user_id)
    end

    def get_dispatch
        Dispatch.find(params[:id])
    end
end
