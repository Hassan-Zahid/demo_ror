class ApiController < ApplicationController
	def ep1
    require 'open-uri'

    if (params[:url])
	    url = params[:url]
	    if !url.include? "http"
	      url = "http://"+url
	    end
	    
	    doc = Nokogiri::HTML(open(url))
	    
	    href = Url.create(url: url)
	    doc.css('h1').each do |h1|
	    	href.contents.create(content_type: "h1", content: h1.text.strip)
	    end
	    doc.css('h2').each do |h2|
	      href.contents.create(content_type: "h2", content: h2.text.strip)
	    end
	    doc.css('h3').each do |h3|
	      href.contents.create(content_type: "h3", content: h3.text.strip)
	    end
	    doc.css('a').each do |link|
	      href.contents.create(content_type: "link", content: link['href'])
	    end

	    render body: "Data Stored in PSQL database successfully"
	  else
	  	render body: "No parameter provided"
	  end
  end

  def ep2
  	@urls = Url.all
  	# binding.pry
  end
end
