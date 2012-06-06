class Member::ProfilesController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :find_user, :only => [ :edit, :update ]
  layout 'profile'
  
  actions :edit, :update, :check_email
  respond_to :html, :only => [ :edit, :update ]
  respond_to :json, :only => [ :check_email ]
  
  def edit
  end
  
  def update
    @user.update_attributes(params[:user]) ? redirect_to(edit_member_profile_path(:username => current_user.username), :notice =>"Your profile was successfully updated.") : redirect_to(edit_member_profile_path(:username => current_user.username), :alert => "There was a problem saving your profile, please try again.")
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
  
  private
  
    def find_user
      @user = User.find(current_user.id)
    end
end
