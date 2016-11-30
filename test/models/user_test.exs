defmodule EDI.UserTest do
  use EDI.ModelCase

  alias EDI.{User}

  @valid_attrs %{email: Faker.Internet.email,
                 name: Faker.Name.first_name}

  @invalid_attrs %{email: "blah"}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with blank email" do
    %{errors: errors} = User.changeset(%User{}, %{})
    assert {:email, {"can't be blank", []}} in errors
  end

  test "changeset with invalid email format" do
    %{errors: errors} = User.changeset(%User{}, @invalid_attrs)
    assert {:email, {"has invalid format", []}} in errors
  end

  test "registration changeset with valid attributes" do
    attrs = Map.merge(@valid_attrs, %{password: "secret"})

    changeset = User.registration_changeset(%User{}, attrs)

    assert changeset.valid?
    assert %{changes: %{password_hash: _}} = changeset
  end
end
