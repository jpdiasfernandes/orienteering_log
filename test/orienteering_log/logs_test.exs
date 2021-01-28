defmodule OrienteeringLog.LogsTest do
  use OrienteeringLog.DataCase

  alias OrienteeringLog.Logs

  describe "logs" do
    alias OrienteeringLog.Logs.Log

    @valid_attrs %{body: "some body", distance: 120.5, effort: 42, elevation: 42, time: 42, title: "some title"}
    @update_attrs %{body: "some updated body", distance: 456.7, effort: 43, elevation: 43, time: 43, title: "some updated title"}
    @invalid_attrs %{body: nil, distance: nil, effort: nil, elevation: nil, time: nil, title: nil}

    def log_fixture(attrs \\ %{}) do
      {:ok, log} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Logs.create_log()

      log
    end

    test "list_logs/0 returns all logs" do
      log = log_fixture()
      assert Logs.list_logs() == [log]
    end

    test "get_log!/1 returns the log with given id" do
      log = log_fixture()
      assert Logs.get_log!(log.id) == log
    end

    test "create_log/1 with valid data creates a log" do
      assert {:ok, %Log{} = log} = Logs.create_log(@valid_attrs)
      assert log.body == "some body"
      assert log.distance == 120.5
      assert log.effort == 42
      assert log.elevation == 42
      assert log.time == 42
      assert log.title == "some title"
    end

    test "create_log/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Logs.create_log(@invalid_attrs)
    end

    test "update_log/2 with valid data updates the log" do
      log = log_fixture()
      assert {:ok, %Log{} = log} = Logs.update_log(log, @update_attrs)
      assert log.body == "some updated body"
      assert log.distance == 456.7
      assert log.effort == 43
      assert log.elevation == 43
      assert log.time == 43
      assert log.title == "some updated title"
    end

    test "update_log/2 with invalid data returns error changeset" do
      log = log_fixture()
      assert {:error, %Ecto.Changeset{}} = Logs.update_log(log, @invalid_attrs)
      assert log == Logs.get_log!(log.id)
    end

    test "delete_log/1 deletes the log" do
      log = log_fixture()
      assert {:ok, %Log{}} = Logs.delete_log(log)
      assert_raise Ecto.NoResultsError, fn -> Logs.get_log!(log.id) end
    end

    test "change_log/1 returns a log changeset" do
      log = log_fixture()
      assert %Ecto.Changeset{} = Logs.change_log(log)
    end
  end
end
