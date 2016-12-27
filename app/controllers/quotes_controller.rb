class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
  end


  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong> Could not save :(</strong> Please ensure your quote is between 3 to 140 characters.'
    else
      flash[:success] = "Your quote was successfully added!"
    end
          redirect_to root_path
  end

  def about
  end


  private

  def quote_params
    params.require(:quote).permit(:saying, :author, :source)
  end


end

