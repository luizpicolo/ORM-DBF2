require "yaml"
require "fileutils"
require_relative "file"
require_relative "livro"
require_relative "carro"

id =  Livro.criar(
  titulo: 'Titulo',
  categoria: 'Técnico',
  autor: 'Sou eu',
  isbn: 123456
)

livro = Livro.selecionar(1)
livro.titulo = "Titulo 3"

Livro.atualizar(livro)
