class NominaController < ApplicationController
    before_action :current_nomina, only: [:edit, :update, :destroy]

    def index
        @nominas = Nomina.all
    end

    def new
        @nomina = Nomina.new
    end
    
    def create
        date = params[:date].split("-")
        age = date[0]
        month = date[1]
        total = Employee.where("date_entry <= ?", params[:date].concat("-01")).sum(:salary)
        
        @nomina = Nomina.new(age: age, month: month, total_amount: total)

        if @nomina.valid?
            @nomina.save
            redirect_to nomina_index_path
        else
            # redirect_to new_nomina_path
            render :new
        end
        

    end

    def edit
        nomina = Nomina.find(params[:id])
        age = @nomina.age
        month = @nomina.month
        @date = age + "-" + month
    end

    def update
        @nomina = Nomina.find(params[:id])
        @nomina.update(nomina_params)

        redirect_to nomina_index_path(@nomina)
    end

    def destroy
        @nomina = Nomina.find(params[:id])
        @nomina.destroy

        redirect_to nomina_index_path(@nomina)
    end

    private

        def current_nomina
            @nomina = Nomina.find(params[:id])
        end
end
