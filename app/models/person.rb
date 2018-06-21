class Person
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :name, type: String
  field :street, type: String
  field :city, type: String
  field :state, type: String
  field :country, type: String

end
