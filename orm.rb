class ORM

  # @@path = 'db/livros'

  def self.criar(*atributos)
    id = verifica_id
    File.open("#{path}/#{id}.yml", "a") do |arquivo|
      obj = self.new atributos
      obj.id = id
      arquivo.puts YAML.dump obj
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

  def self.atualizar(livro)
    FileUtils.rm "db/livros/#{livro.id}.yml"
    salvar(livro)
  end

  private

  def self.verifica_id
    # self.id.nil? ? proximo_id : self.id
    proximo_id
  end

  def self.quantidade_registros
    Dir.glob("db/livros/*.yml").size + 1
  end

  def self.ultimo_id
    files = Dir.entries("#{path}").sort_by do |file|
      File.ctime("#{path}/#{file}")
    end
    File.basename "#{path}/#{files.last}", ".yml"
  end

  def self.path
    "db/#{self.to_s.downcase}"
  end

  def self.proximo_id
    ultimo_id.to_i + 1
  end
end
