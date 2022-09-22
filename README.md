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

## kotlin/ktor
```
# generate project
https://start.ktor.io/

# 動かす環境にダウンロードされたzipファイル(projetctの一式)をコピー

# install jar
chmod 755 ./gradlew
./gradlew :buildFatJar
# container build & run
docker compose --project-directory ./ build
docker compose --project-directory ./ up -d
# コマンド実行してアクセス
$ curl http://localhost:8080
Hello World!

## ref:ktor turorial
# https://github.com/ktorio/ktor-documentation/tree/2.1.1/codeSnippets/snippets/tutorial-website-interactive-docker-compose
git clone git@github.com:ktorio/ktor-documentation.git
cd ktor-documentation/codeSnippets
# install libs
./gradlew :tutorial-website-interactive-docker-compose:buildFatJar
# container up
docker compose --project-directory snippets/tutorial-website-interactive-docker-compose up
```

# links
- [gitignore.io](https://www.toptal.com/developers/gitignore)
- [Elixir入門 11: プロセス](https://dev.to/gumi/elixir-11--2mia)
- [Elixir School](https://elixirschool.com/ja)
- [Elixir神ライブラリ](https://github.com/piacerex/communitex)
- [nim](https://nim-lang.org/)
