README

Intro section

This is a work order system to track via a order number for tasks related to stormwater 
pollution prevention permits(i.e. SW3P). It requires the user to login or signup. Afterwards,
the user will create new order, read existing order, update an order, or delete an order.

Table of Contents

Implementation
Contributing
License
Implementation

Dependencies

gem 'sinatra'
gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'sqlite3'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem "tux"
gem 'rack-flash3'
gem 'faker'
Installation

Usage

gem install swpp

Contributing
Bug reports and pull requests are welcome on GitHub  at https://github.com/ICanDoAllThingThroughChrist/swpp. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

License

(The MIT License)

Copyright (c) 2014 Bill Gooch

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
