class FilvsController < ApplicationController

  def index
    @filv = current_user.filv
  end


end
