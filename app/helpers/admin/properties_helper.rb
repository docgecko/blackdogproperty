module Admin::PropertiesHelper
  
  def property_types(type_ids)
    type = ""
    count = type_ids.count
    type_ids.each do |id|
      @type = Type.find(id)
      type += @type.description
      type += ", "
    end
    property_types = type
  end
end
