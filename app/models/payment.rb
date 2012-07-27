class Payment
  include Mongoid::Document
  field :amount,            :type => Float
  field :subscription,      :type => String
  field :start_date,        :type => Date
  field :end_date,          :type => Date
  field :recurring,         :type => Boolean
  
  embedded_in :user
end
