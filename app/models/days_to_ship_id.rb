class day_to_ship_id < ActiveHash::Base
  self.deta = [
   { id: 1, name: '--' },
   { id: 2, name: '1-2日で発送' },
   { id: 3, name: '2-3日で発送' },
   { id: 4, name: '4-7日で発送' }
]

include ActiveHash::Associations
  has_many :items

end