class Member::ProfilesController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :find_user, :only => [ :edit, :update ]
  layout 'profile'
  
  actions :edit, :update
  respond_to :html
  
  def edit
  end
  
  def update
    @user.update_attributes(params[:user]) ? redirect_to(edit_member_profile_path(:username => current_user.username), :notice =>"Your profile was successfully updated.") : redirect_to(edit_member_profile_path(:username => current_user.username), :alert => "There was a problem saving your profile, please try again.")
  end
  
  private
  
    def find_user
      @user = User.find(current_user.id)
    end
end
