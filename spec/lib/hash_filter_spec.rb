require 'hash_filter'
require 'awesome_print'
describe HashFilter do

  let(:hash) {
    {
      :data => {
        :a => 1,
        :b => [1,2,3],
        :c => {a: 1, b: 2}
      }
    }
  }


  let(:keep_filter) {
    {data: {b: true, c: {b: true}}}
  }

  let(:drop_filter) {
    {data: { c: {b: true}}}
  }


  it "should keep properly" do
    expect(HashFilter.keep(hash,keep_filter)).to eql({data: {b: [1,2,3], c: {b: 2}}})
  end

  it "should drop properly" do
    expect(HashFilter.drop(hash,drop_filter)).to eql(    {
      :data => {
        :a => 1,
        :b => [1,2,3],
        :c => {a: 1}
      }
    })

  end


end
