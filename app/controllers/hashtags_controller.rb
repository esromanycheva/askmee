class HashtagsController < ApplicationController
  def show
    @hashtag = Hashtag.find_by(name: params[:id].delete('#'))
  end
end
