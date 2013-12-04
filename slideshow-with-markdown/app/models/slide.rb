class Slide < ActiveRecord::Base
  after_save :make_file
  
  def make_file
    f = File.new("./mkd/#{self.id}_#{self.name}","w")

    f.write(self.content.to_s)
    f.close

    system ("slideshow build ./mkd/#{self.id}_#{self.name} -o ./public/output")
  end
end
