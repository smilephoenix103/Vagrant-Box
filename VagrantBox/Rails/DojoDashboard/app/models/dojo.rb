class Dojo < ApplicationRecord
    validates :branch, :street, :city, presence: true
    validates :state, presence: true, length: { is: 2 }

    before_save :upcase_state


    def upcase_state
        self.state.upcase!
    end
end
