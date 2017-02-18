# ShadowForm

[![Gem Version](https://badge.fury.io/rb/shadow_form.svg)](http://badge.fury.io/rb/shadow_form)
[![Build Status](https://travis-ci.org/pniemczyk/shadow_form.svg)](https://travis-ci.org/pniemczyk/shadow_form)
[![Dependency Status](https://gemnasium.com/pniemczyk/shadow_form.svg)](https://gemnasium.com/pniemczyk/shadow_form)
[![Code Climate](https://codeclimate.com/github/pniemczyk/shadow_form/badges/gpa.svg)](https://codeclimate.com/github/pniemczyk/shadow_form)

Fat model with validation in all cases always causes problems in the future. So my solution is ShadowForm. Now you can have your original model without validation and the form when you need it.

## Installation


Add this line to your application's Gemfile:

```ruby
gem 'shadow_form'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shadow_form

## How it works
You have your active_record or active_model model:
```ruby
class User
  include ActiveModel::Model
  attr_accessor :name, :email, :password
end
```
And for example register form
```ruby
class UserRegistrationForm < ShadowForm::Core
  shadow_of User
  give_name 'RegisterForm` # optional
  validation do
    validates :email, presence: true
    validates :password, presence: true
  end
end
```
And now you have `UserRegistrationForm` like `User` + `Validation`

## Contributing

1. Fork it ( https://github.com/[my-github-username]shadow_form/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
