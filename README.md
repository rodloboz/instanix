## Instanix: A Phoenix Instagram Clone

# Stack

* Phoenix
* Turbolinks
* Tailwindcss 1.0
* Webpack 4
* PostgreSQL

# DB Schema

![DB Schema Screenshot](/screenshots/schema.png?raw=true)

# Setup

Clone:

    git clone git@github.com:rodloboz/instanix.git

Dependencies:

    mix deps.get

Setup database and seeds:

    mix ecto.setup

# Run

Dev:

    mix phx.server

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
