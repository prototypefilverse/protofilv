class FilvsController < ApplicationController

    def index
     if user_signed_in?
      @filv = current_user.filv
     end
    end

end
