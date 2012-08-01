class Member::SubscriptionsController < InheritedResources::Base
  before_filter :authenticate_user!
  authorize_resource :class => false
  before_filter :find_user, only: [ :new, :create, :show ]

  layout :resolve_layout

  actions :new, :create, :show
  respond_to :html

  belongs_to :user

  def new
    logger.debug "subscriptions#new - start"
    @subscription = Subscription.new
    logger.debug "subscriptions#new - end"
  end

  def create
    logger.debug "subscriptions#create - start"
    @subscription = @user.subscriptions.build(params[:subscription])
    logger.debug "subscriptions#create - built @user.subscriptions"
    @subscription.ip_address = request.remote_ip
    logger.debug "subscriptions#create - added ip_address"
    @subscription.start_date = Date.today
    logger.debug "subscriptions#create - calculated start_date"
    @subscription.end_date = Date.today + 1.year
    logger.debug "subscriptions#create - calculated end_date"
    if @subscription.save
      logger.debug "subscriptions#create - passed 'if @subscription.save'"
      if @subscription.purchase
        logger.debug "subscriptions#create - passed 'if @subscription.purchase'"
        logger.debug "successful purchase"
        redirect_to member_registration_complete_url
      else
        logger.debug "subscriptions#create - failed 'if @subscription.purchase'"
        logger.debug "failed purchase"
        render member_registration_payment_url, :notice => "There was a problem with the transaction with your credit card. Contact us to rectify this."
      end
    else
      logger.debug "subscriptions#create - failed 'if @subscription.save'"
      logger.debug "failed save"
      render member_registration_payment_url
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
