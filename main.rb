require "sinatra"
require "movies"
require "stock_quote"
require "image_suckr"



get "/" do
  erb :index
end


get "/movies/:qu" do
   #content-type :json
   
  unless params[:qu].nil?
    @movie = Movies.find_by_title(params[:qu])
    @make_j = {"title" => @movie.title, "year" => @movie.year.to_s, "plot" => @movie.plot}
  end
  erb :movies , :layout => false
end


get "/stocks/:qu" do
   #content-type :json
   
  unless params[:qu].nil?
    @s = params[:qu]
      @company = StockQuote::Stock.quote(@s.upcase)
  end
  erb :stocks , :layout => false
end

get "/images/:qu" do
   #content-type :json
   
  unless params[:qu].nil?
    begin
      @q = params[:qu]
      suckr = ImageSuckr::GoogleSuckr.new  
      @src = suckr.get_image_url({"q" => "#{@q}"})
    rescue
      @q = nil
      @src = nil
    end
  end
  erb :images , :layout => false
end




get "/images" do
  erb :images
end

post "/images" do

  unless params["query"].nil?
    begin
      @q = params["query"]
      suckr = ImageSuckr::GoogleSuckr.new  
      @src = suckr.get_image_url({"q" => "#{@q}"})
    rescue
      @q = nil
      @src = nil
    end
  end

  erb :images
end


