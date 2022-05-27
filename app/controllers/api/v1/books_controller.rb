class Api::V1::BooksController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, only: [:update]
  before_action :set_book, only: [:show, :update]

  def index
    @books = policy_scope(Book)
  end

  def show
  end

  def update
    if @book.update(book_params)
      render :show
    else
      render_error
    end
  end

  def book_params
    params.require(:book).permit(:name, :author, :category)
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    authorize @book
    if @book.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
    authorize @book
  end

  def render_error
    render json: { errors: @book.errors.full_messages }, status: :unprocessable_entity
  end
end
