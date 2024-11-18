class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy, :kill]
  def index
    @contracts = Contract.all.sort_by(&:updated_at).reverse
  end

  def create
    @contract = Contract.new(contract_params)
    @contract.save
    redirect_to contract_path(@contract), notice: "A new contract has been add to the List"
  end

  def kill
    @contract.update(killed: true)
    redirect_to contract_path(@contract), notice: "Contract target has been eliminated"
  end

  def destroy
    @contract.destroy
    redirect_to root_path, notice: "Contract Destroyed"
  end

  def show
  end

  def edit
  end

  def update
    @contract.update(contract_params)
    redirect_to root_path, notice: "Contract Modified"
  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
  end

  def contract_params
    params.require(:contract).permit(:name, :location, :avatar_url, :killed)
  end
end
