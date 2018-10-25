class RequestsController < ApplicationController
    before_action :set_request, only: [:show, :edit, :update, :destroy]
    respond_to? :json
    before_action :authenticate_user!

    def request_map
        format.json { render :json => @requests.to_json(:only => [:id, :title, :description, :address, :request_type, :done], :methods => [:to_param]) }
    end


#GET /riders.json (showing null)
    def index
        @requests = Request.all
     
        respond_to do |format|
            format.html 
            format.json { render json: @requests }
        end   
    end

    def request_creator
        @requests = Request.all

        respond_to do |format|
            format.html
            format.json { render json: @requests }
        end
    end

    def request_counter
        @requests = Request.where(status:0).count
    end

    def show  
      @request = Request.find(params[:id])
      @conversation= Conversation.new(id: @request.id)       
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
              format.json { render :show, status: :created, Request: @request }
            else
              format.html { render :new }
              format.json { render json: @request.errors, status: :unprocessable_entity }
              
            end
          end

    end

    def edit
    
 
    end

   

    def update
        @request = Request.find(params[:id])
        # @request.increment! :done
            respond_to do |format|
                if @request.update(conversations_count_params)
                @request.conversations_count = 0
                @request.save
                format.html { redirect_to @request, notice: 'Request was successfully updated.' }
                format.json { render :show, status: :ok, Request: @request }
                else
                format.html { render :edit }
                format.json { render json: @request.errors, status: :unprocessable_entity }
                end
            end
    end

    def destroy 
        if current_user = @request.user
          @request.destroy
                respond_to do |format|
                  format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
                  format.json { head :no_content }
                end
        end
    end

    # def incr_done
    #     @request = Request.find(params[:id])
    #     @request.counter = current_user

    #     count = params[:request] && params[:request][:done].to_i

    #     if count.in? [-1,1]
    #       @request.update_attributes(done: @request.done + count)
    #     end

    #     redirect_to @request

    # end

    def republish
        @request = Request.find(params[:id])
             @request.updated_at = Time.now
             @request.save
          redirect_to @request, notice: 'Request was updated.'
    end
    
    def volunteer
        @request = Request.find(params[:id])
        @conversation = Conversation.create!(request_id: @request.id,sender_id: current_user.id,receiver_id: @request.user_id)
        redirect_to @request
    end


    private

    def request_params
        params.require(:request).permit(:title, :description, :request_type, :address, :done)
    end

    def set_request
        @request = Request.find(params[:id])
    end

    def conversations_count_params
        params.require(:request).permit(:conversations_count)
    end
    # def done_params
    #     params.require(:request).permit(:done)
    # end
 
end

    

