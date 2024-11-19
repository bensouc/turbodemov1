class Contract < ApplicationRecord
# apres chaque commit sur create on veut broadcast une nouvelle sur lechanne "contracts"
after_update_commit -> {
                      broadcast_update_to "contracts", partial: "contracts/contract",
                                                       locals: { contract: self }, target: "contract_#{id}"
                    }
after_destroy_commit -> { broadcast_remove_to "contracts", target: "contract_#{id}" }
after_create_commit :broadcast_create
  def killed?
    killed
  end

  def broadcast_create
    broadcast_prepend_to "contracts", partial: "contracts/contract",
               locals: { contract: self }, target: "contracts_list"
  end
end
