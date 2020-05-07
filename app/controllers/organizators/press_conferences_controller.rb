class Organizators::PressConferencesController < ApplicationController


  def index
      @press_conferences = current_organizator.press_conferences
  end

    def show
      @press_conference = current_organizator.press_conferences.find(params[:id])
      @solicitudes = @press_conference.solicituds.includes(:user).order("created_at")
      #INCLUDES: Specify relationships to be included in the result set. En este caso permite acceder a USER

    end

    def new
      @press_conference = PressConference.new

    end

    def edit
      @press_conference = current_organizator.press_conferences.find(params[:id])

    end

    def create

      @press_conference = current_organizator.press_conferences.new(press_conference_params)
          if @press_conference.save
             redirect_to organizators_press_conferences_path
          else
             render :new

          end
    end


        def update
          @press_conference = current_organizator.press_conferences.find(params[:id])
            if @press_conference.update(press_conference_params)
              redirect_to organizators_press_conferences_path

            else
              render :edit

            end
        end

    def destroy
            @press_conference = current_organizator.press_conferences.find(params[:id])
            @press_conference.destroy
            redirect_to organizators_press_conferences_path
    end

    def listaPostulantes
      @press = PressConference.find(params[:press_conference_id])
      @lista = @press.solicituds.where(status: "accepted")
      respond_to do |format|
        format.html
        format.json
        format.pdf do
          render template: '/organizators/press_conferences/listaPostulantes',
          pdf: 'listaPostulantes',

          disposition: 'attachment'
          # type: 'apllication/pdf'

       end
      end
    end


    private

   def press_conference_params
     params.require(:press_conference).permit(:title, :description, :date, :time, :address, :status)
   end
 end
