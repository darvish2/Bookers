class BooksController < ApplicationController


  before_action :authenticate_user!


  before_action :ensure_correct_user,only:[:edit]


  def ensure_correct_user
      @book = Book.find_by(id:params[:id])
      puts @book.user_id
      puts current_user.id
  if @book.user_id != current_user.id
      flash[:notice] = "error"
      redirect_to("/books")
  end
  end


  def index
      @book = Book.new
      @books = Book.all
      @user = User.find(current_user.id)
  end



  def show
      @book = Book.find(params[:id])
      @user = @book.user
      @new = Book.new
  end



  def new
  	  @book = Book.new
  end


  def edit
      @book = Book.find(params[:id])
      @user = User.find(current_user.id)
      # redirect_to edit_book_path(book.id)
  end


  def create
  	  @book = Book.new(book_params)
      @book.user_id = current_user.id
  if @book.save
     flash[:success] = 'successfully'
     redirect_to book_path(@book.id)
  else
     flash[:danger] = 'error'
     @books = Book.all
     @user = User.find(current_user.id)
     render action: :index
  end
  end


  def update
      @book = Book.find(params[:id])
  if @book.update(book_params)
     flash[:success] = 'successfully'
     redirect_to book_path(@book.id)
  else
    flash[:danger] = 'error'
    render action: :edit
  end
  end


  def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path
  end


   def find
       @book = Book.new
       @books = Book.all
       @bookss = User.find(params[:id])
  end



  private
  def book_params
  	  params.require(:book).permit(:title, :body)
end
end