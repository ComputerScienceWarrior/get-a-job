class Portfolios::ProjectsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :find_portfolio
    before_action :find_project, only: [:show, :edit, :update, :destroy]

    def index
        @projects = @portfolio.projects
    end

    def show
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)

        if @project.save
            flash[:alert] = 'You have successfully created your project!'
            redirect_to portfolio_project_path(@project.portfolio, @project)
        else
            flash[:error] = "Failed to create project. #{@project.errors.full_messages.join(', ')}"
            render :new
        end
    end

    def edit
    end

    def update
        if @project.update(project_params)
            flash[:alert] = 'You have successfully updated your Project!'
            redirect_to portfolio_project_path(@project.portfolio, @project)
        else
            flash[:error] = 'There was an error updating your project.'
            render :edit
        end
    end


    def destroy
        if @project.destroy
            flash[:success] = "Project deleted successfully."
        else
            flash[:error] = "Failed to delete the project."
        end

        redirect_to user_portfolios_path(@portfolio.user)
    end

    private

    def project_params
        params.require(:project).permit(:title, :caption, :project_url, :github_url, :thumbnail_url, :demo_url, :portfolio_id)
    end

    def find_project
        @project = Project.find(params[:id])
    end

    def find_portfolio
        @portfolio = Portfolio.find(params[:portfolio_id])
    end
end
