class DispatchesController < ApplicationController

    def index
        @dispatches = Dispatch.all
        render :index
    end
    
    def show
        @dispatch = Dispatch.find(params[:id])
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
        @dispatch = Dispatch.find(params[:id])
        render :edit
    end

    def update
        dispatch = Dispatch.find(params[:id])
        dispatch.assign_attributes(dispatch_params)
        dispatch.full_url
        dispatch.save
        redirect_to dispatch_path(dispatch)
        
    end

    def destroy
        Dispatch.find(params[:id]).destroy
        redirect_to root_path
    end

    private
    def dispatch_params
        params.require(:dispatch).permit(:title, :description, :url, :user_id)
    end
end
