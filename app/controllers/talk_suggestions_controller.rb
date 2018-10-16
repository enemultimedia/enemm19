class TalkSuggestionsController < ApplicationController
  def create
    @talk_suggestion = TalkSuggestion.new(talk_suggestion_params)

    respond_to do |format|
      if @talk_suggestion.save
        format.js {  }
      else
        format.js { render 'error.js.erb' }
      end
    end
  end

  private

  def talk_suggestion_params
    params.require(:talk_suggestion).permit(:subject_or_speaker, :tell_us_more)
  end
end
