class Organizators::PressConferencesController < ApplicationController

  def index
      @press_conferences = PressConference.all
  end

    def show
      @press_conference = PressConference.find(params[:id])

    end

    def new
      @press_conference = PressConference.new

    end

    def edit

    end

    def create
      @organizator = current_organizator
      @press_conference = @organizator.press_conferences.create(press_conference_params)

          respond_to do |format|
          if @press_conference.save
            format.html { redirect_to organizators_press_conferences_path, notice: 'Student was successfully created.' }
          else
            format.html { render :new }

          end
        end
    end

        def update
          respond_to do |format|
            if @press_conference.update(press_conference_params)
              format.html { redirect_to organizators_press_conferences_path, notice: 'Student was successfully updated.' }

            else
              format.html { render :edit }

            end
          end
        end

    def destroy
      @press_conference = PressConference.find(params[:id])
      @press_conference.destroy
      respond_to do |format|
          format.html { redirect_to organizators_press_conferences_path, notice: 'Student was successfully destroyed.' }

      end
    end

    private

    # Never trust parameters from the scary internet, only allow the white list through.
   def press_conference_params
     params.require(:press_conference).permit(:title, :description, :date, :time, :address, :status)
   end

end
