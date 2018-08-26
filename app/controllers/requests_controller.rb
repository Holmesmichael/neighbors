class RequestsController < ApplicationController
    before_action :set_request, only: [:show, :edit, :update, :destroy]
    respond_to? :json
    

    def index
        @requests = Request.all
        respond_to do |format|
            format.html { render(:text => "not implemented") }
            format.json { render json: @request }
        end
    end

    def new
        @request = Request.new
    end

    def create
        @request = Request.new(request_params)
        @request.user = current_user
       
        respond_to do |format|
            if @request.save
              format.html { redirect_to @request, notice: 'Request was successfully created.' }
              format.json { render :show, status: :created, location: @request }
            else
              format.html { render :new }
              format.json { render json: @request.errors.full_messages, status: :unprocessable_entity }
              
            end
          end

    end

    def edit
    end

    def show 
        request = Request.find(params[:id])
        render json: {request:request}
    end

    def update
        respond_to do |format|
            if @request.update(request_params)
              format.html { redirect_to @request, notice: 'Request was successfully updated.' }
              format.json { render :show, status: :ok, location: @request }
            else
              format.html { render :edit }
              format.json { render json: @request.errors, status: :unprocessable_entity }
            end
          end
    end

    def destroy 
        if current_user = @request.user
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
        params.require(:request).permit(:title, :description, :request_type, :lat, :lng)
    end

    def set_request
        @request = Request.find(params[:id])
    end
    
end
