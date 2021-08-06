class LivinRoom < ApplicationRecord
    has_many :reserves
    validates :name, presence: true 

end
