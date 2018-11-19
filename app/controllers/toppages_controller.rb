class ToppagesController < ApplicationController
  def index
    @tasklists = TaskList.all
  end
end
