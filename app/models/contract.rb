class Contract < ApplicationRecord
  after_update_commit -> { broadcast_update_to "contracts", partial: "contracts/contract",
   locals: { quote: self }, target: "contracts" }
  after_create_commit -> { broadcast_prepend_to "contracts", partial: "contracts/contract",
   locals: { quote: self }, target: "contracts" }
  after_destroy_commit -> { broadcast_remove_to "contracts", target: "contract_#{id}"}
  def killed?
    killed
  end
end
