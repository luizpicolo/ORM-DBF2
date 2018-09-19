require "yaml"
require "fileutils"
require_relative "file"
require_relative "livro"
require_relative "biblioteca"

livro = Livro.new "TDD by Picolo 2", "Técnico", "Luiz Picolo", 123456
Biblioteca.salvar(livro)

livros = Biblioteca.listar

livros.each do |livro|
  puts livro.titulo
end
