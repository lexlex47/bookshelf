class Session < ApplicationRecord

  belongs_to :user

  # 在每次生成session前，自动生成random的session key
  before_create do
    self.key = SecureRandom.hex(20)
  end

end
