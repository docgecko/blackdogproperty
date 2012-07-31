class Member::SubscriptionsController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :find_user, only: [ :new, :create, :show ]

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
    @subscription.start_date = Date.today
    @subscription.end_date = Date.today + 1.year
    if @subscription.save
      if @subscription.purchase
        logger.debug "failed purchase"
        render member_registration_payment_url, :notice => "There was a problem with the transaction with your credit card. Contact us to rectify this."
      else
        logger.debug "successful purchase"
        redirect_to member_registration_complete_url
      end
    else
      logger.debug "failed save"
      # format.html { render action: :new }
      redirect_to member_registration_payment_url
    end
  end

  def show
    @user.subscription
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
