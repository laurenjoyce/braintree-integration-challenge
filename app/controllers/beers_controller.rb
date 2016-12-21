class BeersController < ApplicationController
  require 'rubygems'
  require 'braintree'

  

  def index
    @beers = Beer.paginate(:page => params[:page], :per_page => 5)
    sort_attribute = params[:sort]

    @sorting_order = 'sort'
    @sorting_caret = 'glyphicon glyphicon-chevron-up'

    if sort_attribute
      @beers = Beer.order(sort_attribute).paginate(:page => params[:page], :per_page => 5)
      @sorting_order = 'descend'
      @sorting_caret = 'glyphicon glyphicon-chevron-down'
    end

    sort_descending = params[:descend]
    if sort_descending
      @beers = Beer.order(sort_descending => :desc).paginate(:page => params[:page], :per_page => 5)
      # @sorting_order = "sort"
      # @sorting_caret = "glyphicon glyphicon-chevron-up"
    end
    render 'index.html.erb'
  end

  def show
    @beer = Beer.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def edit
    @beer = Beer.find_by(id: params[:id])
  end

  def update
    @beer = Beer.find_by(id: params[:id])
    if @beer.update(name: params[:name],
                    style: params[:style],
                    hop: params[:hop],
                    yeast: params[:yeast],
                    malts: params[:malts],
                    ibu: params[:ibu],
                    alcohol: params[:alcohol],
                    blg: params[:blg],
                    price: params[:price]
                   )
      flash[:success] = 'beer successfully updated!'
      redirect_to "/beers/#{@beer.id}"
    else
      render 'edit.html.erb'
    end
  end

  def new
    render 'new.html.erb'
  end

  def create
    @beer = Beer.new(id: params[:id],
                     name: params[:name],
                     style: params[:style],
                     hop: params[:hop],
                     yeast: params[:yeast],
                     malts: params[:malts],
                     ibu: params[:ibu],
                     alcohol: params[:alcohol],
                     blg: params[:blg],
                     price: params[:price]
                    )
    if @beer.save
      flash[:success] = 'beer successfully created!'
      redirect_to "/beers/#{@beer.id}"
    else
      render 'new.html.erb'
    end
  end

  def destroy
    @beer = Beer.find_by(id: params[:id])
    @beer.destroy
    flash[:success] = 'beer successfully deleted!'
    redirect_to '/beers'
  end
end
