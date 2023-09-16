class Users::PortfoliosController < ApplicationController
    before_action :find_user
    before_action :find_portfolio, only: [:show, :edit, :update, :destroy]

    def index
        @portfolios = @user.portfolios
    end

    def show
    end

    def new
        @portfolio = Portfolio.new
    end

    def edit
    end

    def update
        if @portfolio.update(portfolio_params)
            flash[:alert] = 'You have successfully updated your Portfolio!'
            redirect_to user_portfolio_path(@portfolio.user, @portfolio)
        else
            render :edit
        end
    end

    def create
        @portfolio = Portfolio.new(portfolio_params)
        if @portfolio.save
            flash[:alert] = 'You have successfully created your Portfolio!'
            redirect_to user_portfolio_path(@portfolio.user, @portfolio)
        else
            flash[:alert] = "Failed to create portfolio. #{@portfolio.errors.full_messages.join(', ')}"
            render :new
        end
    end

    def destroy
        if @portfolio.destroy
          flash[:success] = "Portfolio deleted successfully."
        else
          flash[:error] = "Failed to delete the portfolio."
        end
      
        redirect_to user_portfolios_path(@portfolio.user)
      end

    private

    def portfolio_params
        params.require(:portfolio).permit(:title, :description, :user_id)
    end

    def find_portfolio
        @portfolio = Portfolio.find(params[:id])
    end

    def find_user
        @user = User.find(params[:user_id])
    end
end