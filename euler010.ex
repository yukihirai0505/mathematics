defmodule Prime do
  def sieve([l|ls]) do
    [l|ls] |> Enum.filter(fn(x) -> rem(x,l) != 0 end)
  end

  def prime_list(n) do
    prime_list1([],Enum.to_list(2..n),:math.sqrt(n))
  end

  defp prime_list1(p,[l|ls],limit) do
    if l >= limit do
      p ++ [l|ls]
    else
      prime_list1(p++[l],sieve([l|ls]),limit)
    end
  end
end

defmodule Std do
  def next_int() do
    IO.gets("") |> String.trim |> String.to_integer
  end
end

defmodule Solution do
  times = Std.next_int()
  primes = Prime.prime_list(1000000)
  Enum.each(1..times, fn(_) ->
    num = Std.next_int()
    Enum.filter(primes, fn prime -> prime <= num end)
    |> Enum.sum
    |> IO.puts
  end)
end
