class PagesController < ApplicationController
  def index
    @talk_suggestion = TalkSuggestion.new
  end
end
