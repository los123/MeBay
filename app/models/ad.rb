class Ad < ActiveRecord::Base

#VALIDATIONS:
validates :price, :numericality => true
validates :description, presence: true

end
