class FreightsController < ApplicationController
  def new
    power_generator = PowerGenerator.find(params[:id])
    params[:address] = HTTParty.get("http://apps.widenet.com.br/busca-cep/api/cep/#{params[:zipcode]}.json")
  end
end
