class BooksController < ApplicationController
  

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render plain: "Книга не найдена", status: 404
  end
  
  def create
    #render plain: params[:book].inspect
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book # если книга успешно сохранена, перенаправляем на страницу книги
    else
      render :new # если не удалось сохранить книгу, перерисовываем форму
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to main_index_path, notice: "Книга удалена"
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    @book.touch
    if @book.update(book_params)
      redirect_to @book
    else
      render :edit
    end
  end

  private def book_params
    params.require(:book).permit(:title, :author, :genre)
  end
end
