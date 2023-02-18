class QuotesController < ApplicationController
  before_action :set_quote, only: %i[show edit update destroy]

  def index
    @quotes = current_company.quotes.ordered
  end

  def show
    @line_item_dates = @quote.line_item_dates.includes(:line_items).ordered
  end

  def new
    @quote = Quote.new
  end

  def edit; end

  def create
    @quote = current_company.quotes.build(quote_params)

    @quote.save
    respond_with @quote
  end

  def update
    @quote.update(quote_params)

    respond_with @quote
  end

  def destroy
    @quote.destroy

    respond_with @quote
  end

  private

  def set_quote
    @quote = current_company.quotes.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name)
  end
end
