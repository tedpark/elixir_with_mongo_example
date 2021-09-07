# ElixirMongodb

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

한국어로 설명된 블로그.

https://itstedpark.medium.com/elixir-phoenix-with-mongodb-%EB%A1%9C-%EB%A7%8C%EB%93%A4%EC%96%B4%EB%B3%B4%EA%B8%B0-31cbda2da37e

url 주소는 수정하면 됩니다.
mongodb atlas srv 주소도 지원합니다.

{ Mongo, [name: :mongo, database: "YOUR_DATABASE", username: "USERNAME", password: "PASSWORD", url: "localhost:27017"] }

ProgrammingController 에서 아래 devs 를 자신의 db 이름으로 수정 하면 됩니다.
def index(conn, \_params) do
cursor = Mongo.find_one(:mongo, "devs", %{})

질문은 itstedpark@gmail.com 혹은 issue 에 남겨주세요.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: http://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Mailing list: http://groups.google.com/group/phoenix-talk
- Source: https://github.com/phoenixframework/phoenix
