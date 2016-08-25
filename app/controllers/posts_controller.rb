class PostsController < ApplicationController

  require "rubygems"
  require "json"
  require "net/http"
  require "uri"
  require "open-uri"

  def index
    url = "https://www.hl7.org/fhir/patient-example-a.json"
    result = JSON.parse(open(url).read)
    @posts = [
      {
        name: result["name"][0]["family"][0],
        last: result["name"][0]["given"][0],
        gender: result["gender"],
        photo: result["photo"][0]["data"],
        organization: result["contact"][0]["organization"]["display"]
      },
    ]
  end
end
