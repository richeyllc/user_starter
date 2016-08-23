class LandingController < ApplicationController
  layout :landing
  def index
    @message = "This is my landing page index controller."
  end
end
