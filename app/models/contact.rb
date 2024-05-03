class Contact < ApplicationRecord
    require "cpf_cnpj"
    before_save :validate_cpf
    belongs_to :user
    validates :cpf, presence: true, uniqueness: true
    
    def validate_cpf
        unless CPF.valid?(self.cpf)
          errors.add(:cpf, "CPF inválido")
          throw :abort
        end
    end
end
