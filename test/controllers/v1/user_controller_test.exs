defmodule EDI.V1.UserControllerTest do
  use EDI.ConnCase

  alias EDI.{User}

  setup %{conn: conn} do
    user = insert(:user)

    token =
      conn
      |> Guardian.Plug.api_sign_in(user)
      |> Guardian.Plug.current_token

    {:ok,
     conn: put_req_header(conn, "accept", "application/json"),
     user: user,
     token: token}
  end

  describe "POST /v1/users" do
    test "valid data", %{conn: conn} do
      params = %{data: %{email: Faker.Internet.email , password: "secret"}}

      response =
        conn
        |> post("/v1/users", params)
        |> doc
        |> json_response(201)

      assert %{"data" => data} = response
      assert %{"id" => id, "email" => _, "token" => _} = data
      assert Repo.get(User, id)
    end

    test "invalid data", %{conn: conn} do
      params = %{data: %{password: "secret"}}

      response =
        conn
        |> post("/v1/users", params)
        |> json_response(422)

      assert %{"errors" => errors} = response
      assert %{"email" => ["can't be blank"]} = errors
    end
  end

  describe "PUT /v1/users/:id" do
    test "valid data and token", %{conn: conn, user: user, token: token} do
      params = %{data: %{email: Faker.Internet.email}}

      response =
        conn
        |> put_req_header("authorization", "Bearer #{token}")
        |> put("/v1/users/#{user.id}", params)
        |> doc
        |> json_response(200)

      assert %{"data" => data} = response
      assert %{"id" => id, "email" => email} = data
      assert %{email: ^email} = Repo.get(User, id)
    end

    test "valid data and no token", %{conn: conn, user: user} do
      params = %{data: %{email: Faker.Internet.email}}

      response =
        conn
        |> put_req_header("authorization", "Bearer fake_token")
        |> put("/v1/users/#{user.id}", params)
        |> json_response(401)

      assert %{"errors" => errors} = response
      assert %{"code" => 401, "detail" => "Unauthorized"} = errors
    end

    test "invalid data and token", %{conn: conn, user: user, token: token} do
      params = %{data: %{email: "willnotwork"}}

      response =
        conn
        |> put_req_header("authorization", "Bearer #{token}")
        |> put("/v1/users/#{user.id}", params)
        |> json_response(422)

      assert %{"errors" => errors} = response
      assert %{"email" => ["has invalid format"]} = errors
    end
  end

  describe "DELETE /v1/users/:id" do
    test "with token", %{conn: conn, user: user, token: token} do
      response =
        conn
        |> put_req_header("authorization", "Bearer #{token}")
        |> delete("/v1/users/#{user.id}")
        |> doc
        |> response(204)

      assert response
      refute Repo.get(User, user.id)
    end

    test "no token", %{conn: conn, user: user} do
      response =
        conn
        |> put_req_header("authorization", "Bearer fake_token")
        |> delete("/v1/users/#{user.id}")
        |> json_response(401)

      assert %{"errors" => errors} = response
      assert %{"code" => 401, "detail" => "Unauthorized"} = errors
      assert Repo.get(User, user.id)
    end
  end
end
