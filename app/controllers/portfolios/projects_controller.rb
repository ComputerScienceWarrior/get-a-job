class Portfolios::ProjectsController < ApplicationController
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

    def edit
    end

    def update
        if @project.update(project_params)
            flash[:alert] = 'You have successfully updated your Project!'
            redirect_to portfolio_project_path(@project.portfolio, @project)
        else
            render :edit
        end
    end

    def create
        @project = Portfolio.new(project_params)
        if @project.save
            redirect_to portfolio_project_path(@project.portfolio, @project)
        else
            render :new
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
