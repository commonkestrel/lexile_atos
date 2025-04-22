require 'lexile'
require 'atos'

describe Lexile do
  describe "#search" do
    it "searches lexile.com for the supplied isbn" do
      result = Lexile.search 9780545685344
      puts result
    end
  end
end

describe Atos do
  describe "#search" do
    it "searches AR Book Finder for the supplied isbn" do
      result = Atos.search 9780545685344
      puts result
    end
  end
end
