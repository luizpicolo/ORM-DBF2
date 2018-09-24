# require 'active_support/inflector'
require_relative "orm"

class Livro < ORM
  attr_accessor :id, :titulo, :categoria, :autor, :isbn

  def initialize(atributos)
    @titulo = atributos.first[:titulo]
    @categoria = atributos.first[:categoria]
    @autor = atributos.first[:autor]
    @isbn = atributos.first[:isbn]
    # @dir = "db/#{self.class.to_s.downcase}"

    # criar_db
  end

  # def criar_db
  #   FileUtils::mkdir_p @dir unless File.directory?(@dir)
  # end
end
