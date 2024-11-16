class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy, :kill]
  def index
    @contracts = Contract.all.sort_by(&:updated_at).reverse
  end

  def create
    @contract = Contract.new(contract_params)
    @contract.save
    respond_to do |format|
      format.html { redirect_to contract_path(@contract) }
      format.turbo_stream
    end
  end

  def kill
    @contract.update(killed: true)
    redirect_to contract_path(@contract)
  end

  def destroy
    @contract.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream
    end
  end

  def show
  end

  def edit
  end

  def update
    @contract.update(contract_params)
    redirect_to root_path
  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
  end

  def contract_params
    params.require(:contract).permit(:name, :location, :avatar_url, :killed)
  end
end
