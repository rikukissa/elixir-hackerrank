# Sample Input 0: 0 3 4 2
# Sample Input 1: 0 2 5 3

# 2 kengurua
# molemmat alottaa omista lokaatioistaan
# molemmat liikkuu yhdellä hypyllä tietyn metrimäärän
# ratkaise osuvatko ne koskaan samaan paikkaan

# keyword list
# avaimet kenguru1, kenguru2
# tuple (starttipaikka, velocity)


defmodule App do
  def read_input() do
    numbers = IO.gets("")
    |> String.trim
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)

    # todo kokeile elm sisennystä
    [{:kenguru0, {Enum.at(numbers, 0), Enum.at(numbers, 1)}},
     {:kenguru1, {Enum.at(numbers, 2), Enum.at(numbers, 3)}}]
  end
  def meets_each_other(kengurus) do
    current_position_alice = elem(kengurus[:kenguru0], 0)
    current_position_bob = elem(kengurus[:kenguru1], 0)

    movement_alice = elem(kengurus[:kenguru0], 1)
    movement_bob = elem(kengurus[:kenguru1], 1)

    # func_alice = movement_alice * round + current_position_alice
    # func_bob = movement_bob * round + current_position_bob

    # Meillä on funktiot
    #  3x + 0 == 2x + 4

    # 3x - 2x ! 1x + 0 === 4
    diff_ab = movement_alice - movement_bob

    #2 x - 3x
    diff_ba = movement_bob - movement_alice
    #!
    cond do
      diff_ab > 0 ->
      # round = x
      # 4 - 0 / 1
      round = (current_position_bob - current_position_alice) / diff_ab
      # 3 * 4 + 0 === 2 * 4 + 4
      # 12
      func_alice = movement_alice * round + current_position_alice
      # 12
      func_bob = movement_bob * round + current_position_bob

      # true
      func_bob == func_alice

    diff_ba > 0 ->
      round = (current_position_alice - current_position_bob) / diff_ba
      func_alice = movement_alice * round + current_position_alice
      func_bob = movement_bob * round + current_position_bob
      func_bob == func_alice

    diff_ab == 0 ->
      current_position_bob == current_position_alice

    end

    # cond do
    #   current_position_alice == current_position_bob ->
    #     "YES"
    #   current_position_alice >= 9000 ->
    #     "NO"
    #   true ->
    #     movement_alice = elem(kengurus[:kenguru0], 1)
    #     movement_bob = elem(kengurus[:kenguru1], 1)
    #
    #     meets_each_other([
    #       {:kenguru0, {current_position_alice + movement_alice, movement_alice}},
    #       {:kenguru1, {current_position_bob + movement_bob, movement_bob}}
    #     ])
    #   end
  end

  def run do
    App.read_input()
    |> App.meets_each_other
    |> (fn(meets) -> if meets do "YES" else "NO" end end).()
    |> IO.puts
  end
end

App.run

# keyword list + tuple
# http://elixir-lang.github.io/crash-course.html#keyword-list
# http://elixir-lang.github.io/crash-course.html#tuples
# [{kenguru0, {0, 3}}, {kenguru1, {4, 2}}]
