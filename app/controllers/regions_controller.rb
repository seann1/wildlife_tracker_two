class RegionsController < ApplictaionController
  def show
    @region = Region.find(params[:id])
    render('regions/show.html.erb')
  end
end
