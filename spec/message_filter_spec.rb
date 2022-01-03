require_relative 'message_filter'

describe MessageFilter do
  it 'test' do
    filter = MessageFilter.new('foo')
    expect(filter.detect?('hello from foo')).to eq true
  end
end
