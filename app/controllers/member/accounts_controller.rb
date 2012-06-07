class Member::AccountsController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :find_user, :only => [ :edit, :update, :update_password ]
  layout 'account'
  
  actions :edit, :update
  respond_to :html
  
  def edit
  end
  
  def update
    section = params[:section]
    if @user.update_attributes(params[:user])
      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to(edit_member_account_path(current_user, :section => section), :notice =>"Your account information was successfully updated.")
    else
      redirect_to(edit_member_account_path(current_user, :section => section), :alert => "There was a problem saving your account information, please try again.")
    end
  end
  
  def check_email
    new_email = User.first(conditions: { email: params[:user][:email] })
    current_email = User.find(current_user.id)

    if new_email.nil?
      resource = false
    elsif new_email.email == current_email.email
      resource = false
    else
      resource = true
    end
    respond_to do |format|
      format.json { render :json => !resource }
    end
  end
  
  def check_username
    new_username = User.first(conditions: { email: params[:user][:username] })
    current_username = User.find(current_user.id)

    if new_username.nil?
      resource = false
    elsif new_username.username == current_username.username
      resource = false
    else
      resource = true
    end
    respond_to do |format|
      format.json { render :json => !resource }
    end
  end
  
  private
  
    def find_user
      @user = User.find(current_user.id)
    end
end
