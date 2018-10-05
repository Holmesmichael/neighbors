class RequestsController < ApplicationController
    before_action :set_request, only: [:show, :edit, :update, :destroy]
    respond_to? :json
    


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

    def show 
   
        # request = Request.find(params[:id])
        # render json: {request:request}
       
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
        @request.increment! :done
            respond_to do |format|
                if @request.update(done_params)
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

    def incr_done
        @request = Request.find(params[:id])
        count = params[:request] && params[:request][:done].to_i
      
        if count.in? [-1,1]
          @request.update_attributes(done: @request.done + count)
        end
      
        redirect_to @request

      end

      def timer
        @request = Request.find(params[:id])

        timer = Time.now 

        if (Time.now - 24.hours) <= @request.created_at || @request.updated_at 
            
        else 
            
        end
    end


    private

    def request_params
        params.require(:request).permit(:title, :description, :request_type, :address, :done)
    end

    def set_request
        @request = Request.find(params[:id])
    end

    def done_params
        params.require(:request).permit(:done)
    end

   

   
  

 
end

    

