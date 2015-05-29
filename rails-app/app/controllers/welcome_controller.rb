class WelcomeController < ApplicationController
  def index
  end

  def error
    raise "Something wrong :("
  end
end
