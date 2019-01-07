class PagesController < ApplicationController
  def index
    @talk_suggestion = TalkSuggestion.new
  end

  def about
  end

  def speakers
    @speakers = Speaker.all.order(:created_at)
  end
end
