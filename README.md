# Rotx

A rotational cipher, ROT(X), is an ancient enocoding that, given a message, returns a message where each letter has been replaced by the letter exactly X letters after it in the alphabet ordering. Letters near the end of the alphabet wrap around. For example, the translation table for ROT(13) looks like:

    ABCDEFGHIJKLMNOPQRSTUVWXYZ
    NOPQRSTUVWXYZABCDEFGHIJKLM

and therefore the message HELLO becomes URYYB

## Installation

Add this line to your application's Gemfile:

    gem 'rotx'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rotx

## Usage

    rotx 10, 'Reddy, OnRails'
    # => "Bonni, YxBksvc"
    rotx 10, 'Bonni, YxBksvc', false #encrypt=false
    # => "Reddy, OnRails"

    # Rotation numbers greater than 26 should work as well
    rotx 36, 'Reddy, OnRails'
    # => "Bonni, YxBksvc"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
