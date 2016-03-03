**Lekanmastermind**  [![Circle CI](https://circleci.com/gh/andela-oeyiowuawi/lekanmastermind.svg?style=svg)](https://circleci.com/gh/andela-oeyiowuawi/lekanmastermind) [![Coverage Status](https://coveralls.io/repos/github/andela-oeyiowuawi/lekanmastermind/badge.svg?branch=master)](https://coveralls.io/github/andela-oeyiowuawi/lekanmastermind?branch=master)  [![Code Climate](https://codeclimate.com/github/andela-oeyiowuawi/lekanmastermind/badges/gpa.svg)](https://codeclimate.com/github/andela-oeyiowuawi/lekanmastermind)
===================


Welcome to mastermind. This is a classic code breaking game between two players. In this implementation, It is between a player and the computer.
The player selects the level(Beginner, Intermediate and Advanced) in which He/She wants to play and the computer generates Colour sequence based on the level chosen. The game is won when a player correctly guesses the computer sequence or the player runs out of guesses: there are 12 guesses for a player.

----------


**Installation**
-------------

Add this line to your application's Gemfile:

```ruby
gem 'lekanmastermind'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lekanmastermind
## **Usage**

To play the game, open your terminal and run lekanmastermind. Once the game loads up, You can select play or read Instructions.

A random code of varying length is generated depending on the level selected by the player(Duplicates are allowed).

You have twelve guesses per game.

On every guess, you are presented with a message identifying the number of elements you got correctly, and number of colours you got correctly but are in different positions.

To view entry history, enter h or history at any time. To view sequence generated, enter c or cheat at any time To quit the game at any point enter q or quit.

After the game is over or won, The top ten players and the time it tok them to guess the sequence corectly is displayed.

## **Development**

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/lekanmastermind` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/andela-oeyiowuawi/lekanmastermind/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
