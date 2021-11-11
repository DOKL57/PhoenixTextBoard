# PhoenixTextBoard
To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

# Features
PhoenixTextBoard is a website where anyone can create an anonymous text post and comment on other posts.

Basic entities: comments M<->1 posts M<->M tags

A list of posts is displayed on the home page. It is possible to create a new one. Once a post has been created, you can view it and leave a comment. The search is filtered by tags, simply click on the tag of the post and a page will open with all posts that have the selected tag

[![Screenshot-from-2021-11-11-09-08-43.png](https://i.postimg.cc/CKQd2FHx/Screenshot-from-2021-11-11-09-08-43.png)](https://postimg.cc/p9K2hM6w)
[![Screenshot-from-2021-11-11-09-40-12.png](https://i.postimg.cc/J4fqfLxK/Screenshot-from-2021-11-11-09-40-12.png)](https://postimg.cc/N5xmXZWr)
[![Screenshot-from-2021-11-11-09-40-39.png](https://i.postimg.cc/652cb3ry/Screenshot-from-2021-11-11-09-40-39.png)](https://postimg.cc/ZCm6CJDS)
[![Screenshot-from-2021-11-11-09-40-48.png](https://i.postimg.cc/DfY5csb9/Screenshot-from-2021-11-11-09-40-48.png)](https://postimg.cc/F13jrYpp)

# Stack
Application developed with the elixir programming language and phoenix framework + phoenix liveview

The application is developed using the elixir programming language and phoenix framework + phoenix liveview. Postgresql is used as the database.
One of the main advantages of elixir is the speed and fault tolerance system.
In Elixir, supervisors are tasked with restarting processes when they fail. Instead of trying to handle all possible exceptions within a process, the “Let it crash”-philosophy shifts the burden of recovering from such failures to the process' supervisor.

LiveView is server centric. You no longer have to worry about managing both client and server to keep things in sync. LiveView automatically updates the client as changes happen on the server.
LiveView is first rendered statically as part of regular HTTP requests, which provides quick times for "First Meaningful Paint", in addition to helping search and indexing engines.
Then LiveView uses a persistent connection between client and server. This allows LiveView applications to react faster to user events as there is less work to be done and less data to be sent compared to stateless requests that have to authenticate, decode, load, and encode data on every request.
