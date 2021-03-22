class Types::CoordinatesType < Types::BaseObject

  field :latitude, Float, null: true
  field :longitude, Float, null: true

  #取author model coordinates[]中的第一个
  def latitude
    object.first
  end

  #取author model coordinates[]中的最后一个
  def longitude
    object.last
  end

end