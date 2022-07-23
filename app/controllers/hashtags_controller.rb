class HashtagsController < ApplicationController
  def show
    @hashtag = Hashtag.find_by(name: params[:id].delete('#'))
    render_404 if @hashtag.nil?
  end
end
