class Types::AuthorType < Types::BaseObject
  # description: "An Author"

  #graphql type有: ID, String, Float, Int, Boolean
  field :id, ID, null: false
  #加入camelize: false，使传输的值统一
  field :first_name, String, null: true, camelize: false
  field :last_name, String, null: true, camelize: false
  field :yob, Int, null: false
  field :is_alive, Boolean, null: true, camelize: false
  field :full_name, String, null: true, camelize: false

  #不更改使用model，直接在这里添加full_name供前端调用
  #obejct 为 Author object
  def full_name
    ([object.first_name, object.last_name].compact).join(" ")
  end

  #使用自定的CoordinatesType
  #coordinates 因为model中相同的名称，所以自动调用
  field :coordinates, Types::CoordinatesType, null: false

  #int arrayl类型
  field :publication_years, [Int], null: false

end