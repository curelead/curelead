# Rails Reddit Clone

I call it a rails-reddit-clone because it has 'users', 'posts', and 'images'.  Users have_many 'posts', and posts have_many 'images'

Things to note:

- [sorcery](https://github.com/NoamB/sorcery) is used for [simple password authentication](https://github.com/NoamB/sorcery/wiki/Simple-Password-Authentication).
- [acts_as_votable](https://github.com/ryanto/acts_as_votable) keeps score of votes, and provides the capability to vote.
- [filepicker]() is the image uploader and processor, it allows flexible image selection on mobile and desktop, as well as integration with [amazons3](https://aws.amazon.com/s3/)
- [bootstrap 2.3.2](http://getbootstrap.com/2.3.2/) is the front-end framework, utilizing [bootstrapCDN](http://www.bootstrapcdn.com/)
- Specs are written with [rspec](https://github.com/rspec/rspec), utilizing [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
- Rails version 4.0.0(without turbolinks)

## to get started… 
### make sure you have RVM and ruby2

1. <code>bundle install</code>
  - make sure all gems are installed 
2. <code>rake db:migrate db:test:prepare</code>

- sqlite locally 
- System dependencies:
  - requires [inkfilepicker.com](https://www.inkfilepicker.com) account 
