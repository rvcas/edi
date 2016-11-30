defmodule EDI.AuthControllerTest do
  use EDI.ConnCase

  setup do
    {:ok,
     conn: put_req_header(build_conn, "accept", "application/json"),
     user: insert(:user)}
  end

  describe "POST /auth/login" do
    test "successful authentication", %{conn: conn, user: user} do
      params = %{data: %{email: user.email, password: "secret"}}

      response =
        conn
        |> post("/auth/login", params)
        |> doc
        |> json_response(201)

      assert %{"data" => data} = response
      assert %{"id" => _, "email" => _, "token" => token} = data
      assert {:ok, claims} = Guardian.decode_and_verify(token)
      assert claims["sub"] == "User:#{user.id}"
    end

    test "unsuccessful invalid email", %{conn: conn} do
      params = %{data: %{email: "doesnot@exit.com", password: "secret"}}

      response =
        conn
        |> post("/auth/login", params)
        |> json_response(400)

      assert %{"errors" => errors} = response
      assert %{"code" => 400, "detail" => "invalid email"} = errors
    end

    test "unsuccessful invalid password", %{conn: conn, user: user} do
      params = %{data: %{email: user.email, password: "wrongpassword"}}

      response =
        conn
        |> post("/auth/login", params)
        |> json_response(400)

      assert %{"errors" => errors} = response
      assert %{"code" => 400, "detail" => "invalid password"} = errors
    end
  end

  describe "GET /auth/me" do
    test "authenticated user gets their info", %{conn: conn, user: user} do
      token =
        conn
        |> Guardian.Plug.api_sign_in(user)
        |> Guardian.Plug.current_token

      response =
        conn
        |> put_req_header("authorization", "Bearer #{token}")
        |> get("/auth/me")
        |> doc
        |> json_response(200)


      %{email: email, id: id} = user

      assert %{"data" => data} = response
      assert %{"email" => ^email, "id" => ^id} = data
    end

    test "unauthorized user", %{conn: conn} do
      response =
        conn
        |> put_req_header("authorization", "Bearer fake_token")
        |> get("/auth/me")
        |> json_response(401)

      assert %{"errors" => errors} = response
      assert %{"code" => 401, "detail" => "Unauthorized"} = errors
    end
  end
end
