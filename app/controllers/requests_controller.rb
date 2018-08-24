class RequestsController < ApplicationController
    before_action :authenticate_user!

    def index
        requests = Request.all
        render json: {requests: requests}
    end

    def create
        request = Request.new(request_params)
        request.user = current_user
        if request.save
           render json:{
               message: "Your request was saved!",
               request: request,
        }else

         render json: {message: "Sorry, something is wrong here..."}
        end
    end

    def show 
        request = Request.find(params[:id])
        render json: {request:request}
    end

    def update
    end

    def destroy 
        if current_user @request.user
            if @request.destroy
                json_response "Your request was deleted", true, {request: @request}, :ok
            else
                json_response "Sorry, could not delete", false, {}, :unprocessable_entity
            end
        else
            json_response "Sorry, you do not have permission to delete this request", false, {}, :unauthorized
        end
    end

    private

    def request_params
        params.require(:request).permit(:title, :description, :address, :request_type)
    end
    
end
