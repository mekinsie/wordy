require 'rspec'
require 'wordy'
require 'pry'

describe '#Word' do

  describe('.all') do
    it("should return an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

end