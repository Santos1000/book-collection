class Api::V1::BooksController < Api::V1::BaseController
  def index
    @books = policy_scope(Book)
  end

  def show
    @book = Book.find(params[:id])
    authorize @book
  end

  # def create
  #   @book = Book.new(book_params)
  #   @book.user = current_user
  #   authorize @book
  #   if @book.save
  #     render :show, status: :created
  #   else
  #     render_error
  #   end
  # end
end
