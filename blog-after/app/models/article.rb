class Article < ActiveRecord::Base
  attr_accessible :name, :content

  after_save :make_file
  def make_file
    f = File.new("#{RAILS_ROOT}/mkd/#{self.name}","w")

    f.write(self.content.to_s)
    f.close

    system ("slideshow build ./mkd/#{self.name} -o ./public/output")
  end

end
