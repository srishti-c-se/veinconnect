class Donation < ApplicationRecord
  belongs_to :donor_profile
  belongs_to :blood_request
  belongs_to :facility
end
