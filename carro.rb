# require 'active_support/inflector'
require_relative "orm"

class Carro < ORM
  attr_accessor :id, :modelo

  def initialize(atributos)
    @modelo = atributos.first[:modelo]
  end
end
