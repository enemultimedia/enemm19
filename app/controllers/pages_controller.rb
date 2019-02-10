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

  def ambassadors
    @ambassadors = Ambassador.active.ordered
  end

  def schedule
    @events = Event.active.ordered.group_by{|x| x.start.day}
  end

  def faqs
    @faqs = Faq.active.ordered
  end
end
