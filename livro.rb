class Livro
  attr_accessor :id, :titulo, :categoria, :autor, :isbn
  def initialize(titulo, categoria, autor, isbn)
    @titulo = titulo
    @categoria = categoria
    @autor = autor
    @isbn = isbn
  end
end
