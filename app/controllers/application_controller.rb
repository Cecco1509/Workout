class ApplicationController < ActionController::Base
    def new
        @exercises = Array.new
    end
end