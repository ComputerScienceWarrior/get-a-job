class PagesController < ApplicationController
    def home
        @greeting = 'Welcome to our Home Page!'
    end

    def about
        @about_header = 'All About Us!'
    end
end
