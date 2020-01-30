cuntwars-autoclicker
====

<div align="center">
  <img alt="play" src="https://raw.githubusercontent.com/ver-1000000/cuntwars-autoclicker/master/auto.png">
</div>

## これなに
海外のえっちなゲーム(Cuntwars)で、課金したときとかに使える「オート乱闘」をPC起動しっぱなしで永遠に行えるやつ。

私はもうCuntwarsやってないけど。

## 課金しないと使えないの？
覚えてないけどなんか最初の三日間？とかはオート乱闘できた気がする。

私は課金せずにその期間でこれ使ってた気がする。 もう何も覚えてない。

## 動かないんだけど
PR送ってくれればちょっと見てみるけど数年前のコードだし私もよくわからん。

今Cuntwarsの画面構成どうなってるのかもわからん。 

なんかcanvas要素の描画、拡縮のアンチエイリアス加減で画像が変わっちゃうからvisgrepが認識しないとかそういうのがあるんだよねぇ。  
パット見問題なさそうなのに動かない〜ってのはだいたいそれのせいだと思う。  
あなたの環境のスクショから画像切り抜いて使わないとだね、覚えてないけど。

whileのところなんでコメントアウトしてるのかとかもよくわからん。 なんで？

あ、今思い出したわ。 多分画像認識の精度がマチマチだったから値決め打ちにしたんだっけ……？ 違うかな？

## なんで公開したの？
シェルで画像検知するコード結構めんどいからいざというときのためにとっといたんだけど、
ずっとDownloadsディレクトリにいて邪魔だったからgithubにあげた。

privateにするとなんかえっちなゲームをやってることがやましいのか己は？？？みたいな気持ちになるからpublicにした。

## 使い方
私も何も覚えてないから想像で書くけど、

- xautomation(xteコマンド、visgrepコマンド)
- imagemagick(importコマンド)
- gawk(awkコマンド)

に依存してると思う。 xautomation入れたら大抵のディストリで動くんじゃねぇかな、多分。 私はArchlinuxで動かしていたよ。

そうそう、わかると思うけどわからない人はわからないと思うから一応書いておくと、**Linuxで動くシェルスクリプト**だからねこれ。  
**Windowsじゃ動かないよ。** MacとかUnixは知らんけど動くんじゃね？

あとは`main.sh`を見てみて、なんか`GetSCREEN()`関数とかの中にあるcropの値とか変えないとなのかな。  
本当はね、環境変数とか引数とかで入れたりっていうかarandrでサイズ取ったりしろっていう話なのかもしれないけどね、
自分用だったからね。 へへ。

前述の依存パッケージインストールしたら、ブラウザでCuntwars開いて乱闘の画面まで行って、
実行ファイルのあるディレクトリで`./main.sh`したら動くと思うよ。  
端末にいい感じにログが出ると思うから見てみて。