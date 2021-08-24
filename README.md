# Password Protection Lab

## Learning Goals

- Implement login and signup with a password
- Use `has_secure_password` to hash and salt passwords

## Introduction

We're going to make a Rails app that covers a simple authentication flow: users
can create accounts, log in, and log out.

There is some starter code in place for a Rails API backend and a React frontend.
To get set up, run:

```console
$ bundle install
$ npm install --prefix client
```

You can work on this lab by running the tests with `learn test`. It will also be
helpful to see what's happening during the request/response cycle by running the
app in the browser. You can run the Rails server with:

```console
$ rails s
```

And you can run React in another terminal with:

```console
$ npm start --prefix client
```

You don't have to make any changes to the React code to get this lab working.

## Setup

Our app has three pages:

1. A signup page, where the user enters their username, password, and password
   confirmation.
2. A login page, where the user submits their username and password and are then
   logged in.
3. A user homepage, which says, "Welcome, ${username}!"

Users should not be able to log in if they enter an incorrect password.

Note: we're not covering password validations in this lab, so don't worry about
those. Password validation is hard to get right anyway — it's surprisingly easy
to produce rules that decrease password security rather than enhance it.

## Instructions

To complete the lab and get the tests passing, you will need to:

- Create a User model, and migrations for a `users` table with `username` and
  `password_digest` columns. Make sure to use `password_digest`, not
  `password`, in your migration, and to include the has_secure_password macro
  in your model.

- Create a `UsersController` with a `create` method that responds to a `POST /signup` request. It should: create a new user; save their hashed password in
  the database; save the user's ID in the session hash; and return the user
  object in the JSON response.

- Add a `show` method to your `UsersController` that responds to a `GET /me`
  request. If the user is authenticated, return the user object in the JSON
  response.

- Create a Sessions controller with a `create` action for logging in that responds to a `POST /login` request, and a
  `destroy` action for logging out that responds to a `DELETE /logout` request.

Happy coding!

## Resources

- [`has_secure_password`](https://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html)
