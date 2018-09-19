require 'active_support/inflector'

class Livro
  attr_accessor :id, :titulo, :categoria, :autor, :isbn

  def initialize(titulo, categoria, autor, isbn)
    @titulo = titulo
    @categoria = categoria
    @autor = autor
    @isbn = isbn
    @dir = "db/#{self.class.to_s.downcase.pluralize}"

    criar_db
  end

  def criar_db
    FileUtils::mkdir_p @dir unless File.directory?(@dir)
  end
end
