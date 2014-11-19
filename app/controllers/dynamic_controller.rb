class DynamicController < ApplicationController
  def index
    redirect_to signup_path unless signed_in?
  end

  def search
    # Gives flexibility on if params come in via query string or header
    provided_title = params[:title] || request.headers["title"] || "anchorman"
    escaped_title = URI::escape(provided_title)
    response = HTTParty.get("http://www.omdbapi.com/?s=#{escaped_title}")
    results = JSON.parse(response)["Search"]
    @results = results.delete_if { |result| result["Type"] != "movie" }.uniq
  end
end
