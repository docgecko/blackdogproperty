class Member::SubscriptionsController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :find_user, only: [ :new, :create, :show ]
  load_and_authorize_resource

  layout :resolve_layout

  actions :new, :create, :show
  respond_to :html

  belongs_to :user

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = @user.subscriptions.build(params[:subscription])
    @subscription.ip_address = request.remote_ip
    respond_to do |format|
      if @subscription.save
        # ...
        logger.debug "success"
        format.html { redirect_to member_registration_complete_url }
      else
        logger.debug "failure"
        # format.html { render action: :new }
        format.html { redirect_to member_registration_payment_url }
      end
    end
  end


private

  def find_user
    @user = User.find(current_user.id)
  end

  def resolve_layout
    case action_name
    when "new"
      "authentication"
    else
      "dashboard"
    end
  end
end
