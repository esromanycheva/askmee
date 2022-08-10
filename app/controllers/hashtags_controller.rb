class HashtagsController < ApplicationController
  def show
    @hashtag = Hashtag.available.find_by!(name: params[:name])
  end
end
