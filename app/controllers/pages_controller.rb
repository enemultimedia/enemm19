class PagesController < ApplicationController
  def index
    @talk_suggestion = TalkSuggestion.new
  end

  def about
  end
end
