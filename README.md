# one-code
## typescript
```
# ビルド
npx tsc hello.ts
# 実行
node hello.js
```

## elixir
```
# コンパイル
docker run -it --rm --name elixir-container -v "$PWD":/usr/src/myapp -w /usr/src/myapp elixir elixirc hello.ex
# 実行
docker run -it --rm --name elixir-container -v "$PWD":/usr/src/myapp -w /usr/src/myapp elixir elixir -e Hello.hello

# スクリプトとして実行
docker run -it --rm --name elixir-container -v "$PWD":/usr/src/myapp -w /usr/src/myapp elixir elixir hello.exs
```

## nim
```
#コンパイル
docker run --rm --name nim-container -v `pwd`:/usr/src/app -w /usr/src/app nimlang/nim nim c -r hello.nim
#実行
docker run --rm --name nim-container -v `pwd`:/usr/src/app -w /usr/src/app nimlang/nim ./hello
```

## ruby
```
# 実行
docker run -it --rm --name ruby-container -v "$PWD":/usr/src/myapp -w /usr/src/myapp ruby:3.1 ruby hello.rb
```


# links
- [gitignore.io](https://www.toptal.com/developers/gitignore)
- [Elixir入門 11: プロセス](https://dev.to/gumi/elixir-11--2mia)
- [Elixir School](https://elixirschool.com/ja)
- [Elixir神ライブラリ](https://github.com/piacerex/communitex)
- [nim](https://nim-lang.org/)
