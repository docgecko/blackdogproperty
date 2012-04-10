class Admin::TeamController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'
  
  actions :all
  respond_to :html
end
