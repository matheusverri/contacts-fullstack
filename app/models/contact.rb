class Contact < ApplicationRecord
    belongs_to :user
    validates :cpf, presence: true, uniqueness: true
end
