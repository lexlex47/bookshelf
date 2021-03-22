class Author < ApplicationRecord

  #自定义的type,返回一个object
  def coordinates
    [rand(90.0), rand(90.0)]
  end

  #自定义一个array
  def publication_years
    (1..rand(10)).to_a.map{ 1900 - rand(100)}
  end

end
