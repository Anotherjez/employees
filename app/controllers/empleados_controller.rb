class EmpleadosController < ApplicationController

    before_action :current_employee, only: [:show, :edit, :update, :destroy]

    def home
        
    end

    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def new
        @employee = Employee.new
    end
    
    def create
        employee = Employee.create(employee_params)

        redirect_to empleado_path(employee)
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])
        @employee.update(employee_params)

        redirect_to empleado_path(@employee)
    end

    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy

        redirect_to empleados_path
    end

    private
        def employee_params
        params.require(:employee).permit(:cedula, :name, :lastname, :phone, :email, :department, :position, :date_entry, :salary)
        end

        def current_employee
            @employee = Employee.find(params[:id])
        end
end
