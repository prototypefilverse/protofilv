class FilvsController < ApplicationController

  def index
    @filv = Filv.find_by(id: 1)
  end

end
