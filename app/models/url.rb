class Url < ApplicationRecord
	has_many :contents, dependent: :destroy
end
