class Users::PortfoliosController < ApplicationController
    before_action :find_portfolio, only: [:show, :edit, :create, :destroy]
    before_action :find_user

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

    def create
        if @portfolio.save(portfolio_params)
            # flash message to save portfolio was saved
            redirect_to user_portfolio_path(@portfolio.user, @portfolio)
        else
            render :new
        end
    end

    def destroy
        # delete the portfolio
    end

    private

    def portfolio_params
        params.require(:portfolio).permit(:title, :description, :user_id)
    end

    def find_portfolio
        @portfolio = Portfolio.find(params[:id])
    end

    def find_user
        @user = @portfolio.user
    end
end