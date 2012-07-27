class Member::PaymentsController < InheritedResources::Base
  before_filter :authenticate_user!
  load_and_authorize_resource

  actions :new, :show
  respond_to :html

  def new
    @user = User.find(current_user.id)
  end
  
  def show
  end
  
end
