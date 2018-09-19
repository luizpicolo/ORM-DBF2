class Biblioteca

  @@path = 'db/livros'

  def self.salvar(livro)
    id = quantidade_registros
    File.open("db/livros/#{id}.yml", "a") do |arquivo|
      livro.id = id
      arquivo.puts YAML.dump livro
    end
  end

  def self.listar
    @livros = []
    $/ = '\n\n'

    (1..quantidade_registros).each do |id|
      path = "#{@@path}/#{id}.yml"
      if File.exist?(path)
        File.open(path, "r").each do |livro|
          @livros << YAML.load(livro)
        end
      end
    end

    @livros
  end

  def self.selecionar(titulo)
    @livros_selecionados = []
    listar.each do |livro|
      @livros_selecionados << livro if livro.titulo == titulo
    end

    @livros_selecionados
  end

  def atualizar(livro)
    FileUtils.rm "db/livros/#{livros.id}.yml"
    salvar(livro)
  end

  private

  def self.verifica_id(livro)
    livro.id.nil? ? proximo_id : livro.id
  end

  def self.quantidade_registros
    Dir.glob("db/livros/*.yml").size + 1
  end

  def self.ultimo_id
    files = Dir.entries("db/livros").sort_by do |file|
      File.birthtime("#{"db/livros"}/#{file}")
    end
    File.basename "db/livros/#{files.last}", ".yml"
  end

  def self.proximo_id
    ultimo_id.to_i + 1
  end
end
