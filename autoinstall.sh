#!/bin/sh

#インストール先のPCで走らせる

dpkg -l | sed '1,5d' | awk '{print $2}' > packlist.txt
ssh ユーザー名＠元PCのIPアドレス sh makeinstlist.sh
scp ユーザー名＠元PCのIPアドレス:~/packlist2.txt ./
diff -u packlist.txt packlist2.txt | grep ^+ | sed s/^+// > installlist.txt
echo 'インストール先PCのパスワード' | sudo -S echo 1 2> /dev/null
while read line
do
sudo apt -y install "$line"
done < installlist.txt
