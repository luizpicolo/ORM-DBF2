require "yaml"
require "fileutils"
require_relative "file"
require_relative "livro"
require_relative "biblioteca"

livro = Livro.new "TDD by Picolo 2", "Técnico", "Luiz Picolo", 123456
Biblioteca.salvar(livro)

livro.titulo = "TDD by Picolo 3"

Biblioteca.atualizar(livro)

# puts Biblioteca.ultimo_id
#
# livros = Biblioteca.selecionar('TDD by Picolo 2')

# livros = Biblioteca.listar
#
# livros.each do |livro|
#   puts livro.titulo
# end
