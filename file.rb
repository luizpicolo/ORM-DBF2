class File
  def self.birthtime(file)
    Time.at(`stat -f%B "#{file}"`.chomp.to_i)
  end
end
