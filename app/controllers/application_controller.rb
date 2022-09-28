class ApplicationController < ActionController::API

    def index

        students = 
        student = 
        if params[:name] 
            Student.find_by_last_name(params[:name]) || Student.find_by_first_name(params[:name])  
          Student.where("last_name LIKE ? OR first_name LIKE ?", "%#{params[:name]}%", "%#{params[:name]}%") 
        else
           Student.all
        end  
    
        render json: students, only: [:first_name, :last_name, :grade] 
        render json: student, except: [:created_at, :updated_at, :id]
      end
    
      def show
        student = Student.find(params[:id])
        render json: student
      end
end
