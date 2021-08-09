#!/bin/sh

#比較する元PCに作っておく，インストールされているパッケージリストの作成

dpkg -l |sed '1,5d'| awk '{print $2}' > packlist2.txt
