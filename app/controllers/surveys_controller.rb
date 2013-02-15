class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def new
    @survey = Survey.new
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(params[:survey])
    	flash[:notice] = "Survey is updated."
    	redirect_to @survey
    else 
	flash[:notice] = "Survey has not been updated."
        render :action => "edit"
    end
  end

  def create
    @survey = Survey.new(params[:survey])
    if @survey.save
    	flash[:notice] = "Survey has been created."
    	redirect_to @survey
    else
	flash[:alert] = "Survey has not been created."
	render :action => "new"
    end
  end

  def show
    @survey = Survey.find(params[:id])
  end
end
