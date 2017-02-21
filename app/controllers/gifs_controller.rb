class GifsController < ApplicationController
  before_action :authorize!
  def index
    @gifs = Gif.all
  end
end
