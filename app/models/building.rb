class Building < ActiveRecord::Base
  validates_presence_of :city
  validates_presence_of :address
  validates_presence_of :state
  validates_presence_of :postal_code
  validates_numericality_of :postal_code
  validates_length_of :postal_code, is: 5
  validates_inclusion_of :state, in: :only_us_states


  def only_us_states
    States.list
  end

end
