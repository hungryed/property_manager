class States
  include Carmen

  def self.list
    us = Country.named('United States')
    us.subregions.map(&:name)
  end
end
