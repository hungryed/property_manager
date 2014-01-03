class States
  include Carmen

  def self.list
    us = Country.name('United States')
    us.subregions.map(&:name)
  end
end
