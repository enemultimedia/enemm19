class PagesController < ApplicationController
  def index
    @talk_suggestion = TalkSuggestion.new
  end

  def about
    @sponsors = Sponsor.active.ordered
  end

  def speakers
    @speakers = Speaker.active.ordered.with_info
  end
end
