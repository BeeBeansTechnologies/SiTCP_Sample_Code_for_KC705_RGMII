Read this in other languages: [English](README.md), [日本語](README.ja.md)

# SiTCP Sample Code for KC705 RGMII

KC705通信確認用のSiTCPサンプルソースコード（RGMII版）です。

SiTCPの利用するAT93C46のインタフェースをKC705のEEPROM(M24C08)に変換するモジュールを使用しています。

また、KC705に搭載されているI2CスイッチPCA9548Aを動作させるモジュールも使用しています。

ファームウェアをKC705へダウンロードする前に、KC705のリファレンスJ29、J30、J64のジャンパーを
下記のように設定してください（Xilinx UG810参照）。

* J29：ピン1-2間をジャンパー接続
* J30：ジャンパーなし
* J64：ジャンパーON


## SiTCP とは

物理学実験での大容量データ転送を目的としてFPGA（Field Programmable Gate Array）上に実装されたシンプルなTCP/IPです。

* SiTCPについては、[SiTCPライブラリページ](https://www.bbtech.co.jp/products/sitcp-library/)を参照してください。
* その他の関連プロジェクトは、[こちら](https://github.com/BeeBeansTechnologies)を参照してください。

![SiTCP](sitcp.png)


## 履歴

#### 2022-06-07 Ver.1.0.1
* 「kc705sitcp.v」
    * ポート名を修正
    * RBCPモジュールをインスタンシエーション
    * DIPスイッチ割り当てを追加
    * 誤記修正
* 「RBCP.v」
    * 新規追加
* 「kc705sitcp.xdc」
    * ポート名を修正
    * 制約を追加

#### 2018-06-21 Ver.1.0.0

* 新規登録。