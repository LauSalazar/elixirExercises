{:ok, account} = Balance.create(1000)

Balance.deposit(account, 100) |> IO.inspect()
Balance.withdraw(account, 30) |> IO.inspect()

IO.puts("---------------------------")

{:ok, account} = GenBalance.create(1000)

GenBalance.deposit(account, 100) |> IO.inspect()
GenBalance.withdraw(account, 30) |> IO.inspect()
