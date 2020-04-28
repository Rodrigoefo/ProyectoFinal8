class Organizators::ProfileController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def update
    @profile= current_organizator
    respond_to do |format|
        if @profile.update(organizator_params)
          format.html { redirect_to organizators_press_conferences_path }
        else
          format.html { render :edit }
        end
  end
end
private

      def organizator_params
        params.require(:organizator).permit(:name, :phone, :description, :address)
      end
end
