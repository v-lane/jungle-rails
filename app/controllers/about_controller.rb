class AboutController < ApplicationController

  def index
    @product_image = Product.find(1).image.url
  end

end
