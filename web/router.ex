defmodule EDI.Router do
  use EDI.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt_auth do
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end


  scope "/" do
    pipe_through [ :api, :jwt_auth ]

    scope "/auth", EDI do
      get "/me", AuthController, :show
      post "/login", AuthController, :create
      delete "/logout", AuthController, :delete
    end

    scope "/v1", EDI.V1, as: :v1 do
      resources "/users", UserController, only: [ :update, :delete, :create ]
      resources "/orders", OrderController, only: [ :create ]
    end

    scope "/v2", EDI.V2, as: :v1 do

    end
  end
end
