#使用input obejct query
#这样前端可以直接使用inputobject进行传输入值----<
class Types::AuthorInputType < GraphQL::Schema::InputObject

  graphql_name "AuthorInputType"
  description "All the attributes for creating an author"

  #引入ID是因为可以使用 update需要使用ID
  argument :id, ID, required: false
  argument :first_name, String, required: false, camelize: false
  argument :last_name, String, required: false, camelize: false
  argument :yob, Int, required: false
  argument :is_alive, Boolean, required: false, camelize: false
end
#>-----------------

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

  #加入error反馈validation
  field :errors, [Types::ErrorType], null: true
  def errors
    #把activeRecord返回的errors，装载入可以方便查看的errortype
    object.errors.map{|e| {field_name: e, errors: object.errors[e]}}
  end

end