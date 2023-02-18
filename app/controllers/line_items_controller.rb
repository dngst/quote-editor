class LineItemsController < ApplicationController
  before_action :set_quote
  before_action :set_line_item_date
  before_action :set_line_item, only: %i[edit update destroy]

  def new
    @line_item = @line_item_date.line_items.build
  end

  def edit; end

  def create
    @line_item = @line_item_date.line_items.build(line_item_params)
    @line_item.save

    respond_with @line_item
  end

  def update
    @line_item.update(line_item_params)

    respond_with @line_item
  end

  def destroy
    @line_item.destroy

    respond_with @line_item
  end

  private

  def line_item_params
    params.require(:line_item).permit(:name, :description, :quantity, :unit_price)
  end

  def set_quote
    @quote = current_company.quotes.find(params[:quote_id])
  end

  def set_line_item_date
    @line_item_date = @quote.line_item_dates.find(params[:line_item_date_id])
  end

  def set_line_item
    @line_item = @line_item_date.line_items.find(params[:id])
  end
end
