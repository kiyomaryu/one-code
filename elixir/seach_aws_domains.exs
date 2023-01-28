args = IO.gets "type word: "
domain =  String.replace(args,"\n","")
profile = "default"

System.cmd("bash", ["-c","aws s3 ls | awk '{print $3}'"])
|> elem(0)
|> String.split("\n")
|> Enum.each(
    fn(s) ->
      if Regex.run(~r/#{domain}/, s) do
        IO.puts(s <> " #{profile}")
      end
    end
  )
