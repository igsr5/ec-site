# テンプレートの変更

- `env.sh`, `nfs.env.sh` の `project_name` を変更する
- `config/database.yml` のデータベース名を変更する
- `config/application.rb` のmodule名を変更する


# 開発環境動かすまで

```
source env.sh
source nfs.env.sh  # NFS を使う場合（Linux ネイティブじゃないならこちらがおすすめ）
touch secrets.env
mkdir tmp/pids
build
bundle install
rake db:create ridgepole:apply db:seed db:seed_fu
```

# 起動
以下はシェルを起動したら初めに

```
source env.sh
source nfs.env.sh # NFS を使う場合（Linux ネイティブじゃないならこちらがおすすめ）
```

をしてから行うこと。

## Spring server

シェルを1つ用意して

```
spring
```

と打ち込んで放置する。これで spring server が立ち上がり続ける。
基本的に spring server は常に起動しておく。
そうでないと rails console などが使えなくなる。

## Rails

別のシェルを用意して

```
app
```

とする。再起動する場合は `ctrl+c` で停止できる。うまく停止できなかったときは

```
stop app
app
```

で再起動する。

## Rails console

こちらも別のシェルを用意して

```
rails c
```

でOK。

# Seed

```
# 基本
rake db:seed_fu
```


# テスト / Rubocop

```
# テスト環境の DB 更新（初回とその後必要に応じて）
rake ridgepole:apply RAILS_ENV=test
# テスト実行
rspec
# 特定のテストだけを実行する場合
rspec spec/path/to/sepc.rb
# 行を指定することもできる
rspec spec/path/to/sepc.rb:33

# Rubocop
rubocop
```

# メール

MailCatcher http://localhost:1080/ で送られたメールを見れます

# ドキュメント

yardによるドキュメントが以下のURLで閲覧できる．

- http://localhost:8808
- https://dev.twogate.net/fanapp/fanapp-base/yard/index.html


またSwaggerによるAPIドキュメントが以下のURLで閲覧できる．

- http://localhost:8080
- https://dev.twogate.net/fanapp/fanapp-base/index.html

# その他
## Volumeの削除

- PostgreSQLをアップデートすると、互換性の問題で起動しないことがある。
- まずコンテナを削除する
- 次にdocker volume ls でpostgresのデータを探し出して削除するか、
- 宙ぶらりんデータを削除する(以下)

```
docker volume rm `docker volume ls -q -f dangling=true`
```
