require 'rspec'
require 'definition'
require 'pry'

describe '#Definition' do


  describe('.all') do
    it("should return an empty array when there are no definitions") do
      expect(Definition.all).to(eq([]))
    end
  end
  
end