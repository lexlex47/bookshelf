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

  # 只有latitude > 10 longtitude < 10 才会生效，要么会报错 unauthorized_object
  def self.authorized?(object,context)
    object.first > 10 && object.last < 10
  end

end