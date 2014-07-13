# HashFilter

Recursively filter hashes

## Installation

Add this line to your application's Gemfile:

    gem 'hashfilter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hashfilter

## Usage

```ruby
  hash =
    {
      :data => {
        :a => 1,
        :b => [1,2,3],
        :c => {a: 1, b: 2}
      }
    }



  keep_filter =  {data: {b: true, c: {b: true}}}

  HashFilter.keep(hash, keep_filter) # {data: {b: [1,2,3], c: {b: 2}}}

  drop_filter = {data: { c: {b: true}}}

  HashFilter.drop(hash, drop_filter) #       :data => {
                                     #        :a => 1,
                                     #        :b => [1,2,3],
                                     #        :c => {a: 1}}




```
## Contributing

1. Fork it ( http://github.com/<my-github-username>/hash_filter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
