class Member::SubscriptionsController < InheritedResources::Base
  before_filter :authenticate_user!
  authorize_resource :class => false
  before_filter :find_user, only: [ :new, :create, :show ]

  layout :resolve_layout

  actions :new, :create, :success, :failure
  respond_to :html

  belongs_to :user

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = @user.subscriptions.build(params[:subscription])
    @subscription.ip_address = request.remote_ip
    @subscription.start_date = Date.today
    @subscription.end_date = Date.today + 1.year
    if @subscription.save
      if @subscription.purchase
        redirect_to member_registration_complete_url
      else
        render member_registration_payment_url, :notice => "There was a problem with the transaction with your credit card. Contact us to rectify this."
      end
    else
      render member_registration_payment_url, :notice => "We were complete this step, please try again or contact us for help."
    end
  end

  def failure
  end
  
  def success
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
