 A simple crud project made with Phoenix, practicing concepts I've been studying. <br>
 I intend to improve this repository more and more with concepts and learnings that I am studying daily.

<hr>
To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


## Routes Reference

#### Create Account

```http
  POST /api/accounts
```

| Parameter | Description |
| :-------- | :------- |
| `cpf email name password ` | **Not Required Token**. `password` min length 8 |

#### Receive Token

```http
  POST /api/accounts/signin/:id/:password
```
| Parameter | Description |
| :-------- | :------- |
| `id`  `password` | **Not Required Token**. returns your token to authenticate to make others requests . |


#### Get Account by id
```http
  GET /api/accounts/:id
```

| Parameter | Description |
| :-------- | :------- |
| `id` | **Required Token** |

#### Update Account 
```http
  PUT /api/accounts/:id
```

| Parameter | Description |
| :-------- | :------- |
| `id` | **Required Token**. `password` required to update account data, ex: name and email |



#### Delete Account 
```http
  DELETE /api/accounts/:id
```

| Parameter | Description |
| :-------- | :------- |
| `id` | **Required Token**. remove account created|


# Libraries:
extra libs used during development.

* Argon2: https://hexdocs.pm/argon2_elixir/Argon2.html  used to encrypt data in this application.
* Guardian: https://hexdocs.pm/guardian/readme.html  An authentication library for use with Elixir apps.

## Learn more Phoenix Framework

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
