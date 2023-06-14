class Band < ApplicationRecord
    validates :name, uniqueness:true, presence:true
end
