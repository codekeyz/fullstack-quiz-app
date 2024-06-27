# Fullstack Quiz App in Dart

## Getting Started

### Migrations

Execute migrations using this command

```
$ dart run yaroorm migrate
```

> Run `dart run yaroorm` in your terminal to see all available commands

### Start Server

Run this command to start your Dart server.

```
$ dart run bin/server.dart
Server listening on port 8080
```

### Backend Routes

- `POST: /register`

  Register a user. Requires `email`, `username` and `password`

- `POST: /login`

  Login a user. Requires `email` and `password`.

### How To Use

When you add a new Entity Model eg: `Post`, generate a migration using `dart run yaroorm create create_posts_table`.

You can run `dart run yaroorm` to see available commands.
