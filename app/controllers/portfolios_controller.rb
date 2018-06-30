class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  layout "portfolio"
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  def index
    @portfolio_items = Portfolio.by_position
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:postion])
    end
    render nothing: true
  end
  
  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def show
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end
  
  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    if @portfolio_item.save
      redirect_to portfolios_path, notice: "Your portfolio item is now live"
    else
      format.html {render :new}
    end
  end

  def edit
  end

  def update
    if @portfolio_item.update(portfolio_params)
      redirect_to portfolios_path, notice: "Your portfolio item is updated"
    end
  end

  def destroy
    @portfolio_item.destroy
    redirect_to portfolios_path, notice: "Your portfolio item is destroyed"
  end

  private
    def portfolio_params
      params.require(:portfolio).permit(:title,
                                        :subtitle,
                                        :body,
                                        technologies_attributes: [:name]
                                        )
    end

    def set_portfolio_item
      @portfolio_item = Portfolio.find(params[:id])
    end
end
