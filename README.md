docker-scala
==============

## **起動コマンド**
```
docker run -dP --name='scala'  -v /home/scala/workspace:/root/workspace --privileged=true t10471/scala /sbin/my_init --enable-insecure-key
```

## **scpで親から鍵を取得**
```
user parentは置換する
scp  user@parent:~/.ssh/id_rsa_github ~/.ssh/id_rsa_github
```

## **dotfilesを取得**

```
git clone git@github.com:t10471/dotfiles.git dotfiles
cd dotfiles
sh link.sh
```
