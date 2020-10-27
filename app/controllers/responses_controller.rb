class ResponsesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_response, only: [:edit, :update: :show, :destroy]
    before_action :set_avaliation, except: [:new]


    def create

        @respond = @avaliation.responses.create(params[:respond]).permit(:respond, :avaliation_id)
        @respond.user_id = current_user.id

        #Para responder uma avaliação
        respond_to do |format|
            if @respond.save
                format.html { redirect_to avaliation_path(@avaliation) }
                format.js   #renderiza create.js.erb e mostra a página continuamente, sem precisar atualziar pra ver os comentários
            else
                format.html { redirect_to avaliation_path(@avaliation), notice: 'A resposta não foi salva. Por favor, tente novamente.' }
                format.js
            end
        end
    end

    def new
    end

    def destroy
        @respond = @avaliation.responds.find(params[:id])
        @respond.destroy
        redirect_to avaliation_path(@avaliation)
    end

    def edit
        @avaliation = Avaliation.find(params[:avaliation_id])
        @respond = @avaliation.responds.find(params[:id])
    end

    def update
        @respond = @avaliation.responds.find(params[:id])
        respond_to do |format|
            if @respond.update(respond_params)
                format.html { redirect_to avaliation_path(@avaliation), notice: 'Resposta atualizada com sucesso.' }
            else
                format.html { render :edit }
                format.json { render json: @respond.errors, status: :unprocessable_entity }
            end
        end
    end



    private

    def set_avaliation
        @avaliation = Avaliation.find(params[:avaliation_id])
    end

    def set_response
        @respond = Respond.find(params[:id])
    end

    def respond_params
        params.require(:respond).permit(:respond)
    end


end