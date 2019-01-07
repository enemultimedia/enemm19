class PagesController < ApplicationController
  def index
    @talk_suggestion = TalkSuggestion.new
  end

  def about
  end

  def speakers
    @speakers = Speaker.active.ordered.with_info
  end
end
