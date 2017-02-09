# exec_orders

A bot that tweets every time there's a new executive order.

## Installation instructions

1. Make sure you have Homebrew and rbenv installed.
1. Make sure you have Ruby 2.4.0 by running `ruby test.rb`. If you don't, install Ruby 2.4.0:
  1. Upgrade your version of ruby-build by running `brew upgrade ruby-build`.
  1. Install Ruby 2.4.0 by running `rbenv install 2.4.0`.
1. Install bundler by running `gem install bundler`.
1. Set up dependencies by running `bundle install`.

## Verify your installation

Run:

```
rake test
```

You should see:

```
/Users/(you)/.rbenv/versions/2.4.0/bin/ruby test.rb
Hello! You are running Ruby 2.4.0.
```
