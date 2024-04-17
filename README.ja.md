# sample_list の README
[![en](https://img.shields.io/badge/lang-en-red.svg)](https://github.com/tomgly/sample_list/blob/main/README.md)
[![en](https://img.shields.io/badge/lang-ja-blue.svg)](https://github.com/tomgly/sample_list/blob/main/README.ja.md)

sample_list は、Isar Database のローカル DB パッケージを学習するために設計された Flutter プロジェクトです。この README は、インストール手順から機能の詳細な説明までを網羅した包括的なガイドとして機能します。

## 目次

- [機能](#機能)

- [インストール](#インストール)

  - [前提条件](#前提条件)

  - [リポジトリのクローン](#リポジトリのクローン)

  - [設定](#設定)

  - [ビルドと実行](#ビルドと実行)

- [使用方法](#使用方法)

- [コントリビュート](#コントリビュート)

- [ライセンス](#ライセンス)

## 機能

sample_list の主な機能と機能をリストです：

- **カスタマイズ可能**: 好きなアイテムに変更できます。私は車を管理するアプリを開発しているので、車用のデータベースを使用しています。

- **ローカルデータベース管理**: Isar Database のローカル DB パッケージを利用して、sample_list はローカルデータベースを効率的に管理できます。

- **リストの作成と管理**: アイテムを効率的に整理するために、リストを簡単に作成、編集、削除できます。

- **ユーザーフレンドリーなUI**: このアプリはクリーンで直感的なインターフェイスを誇り、ユーザーは簡単に操作して機能を利用できます。

## インストール

以下の手順に従って、sample_list をシステムにインストールし、実行してください。

### 前提条件

始める前に、次のディペンデンシーがインストールされていることを確認してください：

- [isar](https://pub.dev/packages/isar)

- [intl](https://pub.dev/packages/intl)

- [flutter_slidable](https://pub.dev/packages/flutter_slidable)

### リポジトリのクローン

1. ターミナルまたはコマンドプロンプトを開きます。

2. 次のコマンドを使用して sample_listのリポジトリをクローンします：

```bash
git clone https://github.com/tomgly/sample-list.git
```

### 設定

1. 作業ディレクトリをクローンしたリポジトリに変更します：

```bash
cd sample-list
```

2. 次のコマンドを使用して必要なディペンデンシーをインストールします：

```bash
flutter pub get
```

3. アイテムを変更したい場合は、このファイル [collections/car.dart](lib/collections/car.dart) を編集するか、これと同様の新しいファイルを作成してください：

```dart
import 'package:isar/isar.dart';

part '[File Name].g.dart';

@Collection()
class [File Name] {
  /// ID to auto-increment
  Id id = Isar.autoIncrement;

  /// Item Name
  late String name;
}
```

4. コレクションクラスの自動生成ファイルを生成するには、次のコマンドを実行します：

```bash
flutter pub run build_runner build
```

実行すると、*.g.dart ファイルが自動的に生成されます：

```
.
└── collections
    ├── [File Name].dart
    ├── [File Name].g.dart
```


### ビルドと実行

1. デバイスに接続するかエミュレータを起動します。


2. プロジェクトをビルドして実行するには、次のコマンドを使用します：


```bash
flutter build
flutter run
```

これにより、プロジェクトがビルドされ、接続されたデバイスまたはエミュレータにインストールされます。

## 使用方法

アプリケーションが実行されると、アイテムリストを作成してアイテムを簡単に管理できます。

## コントリビュート

sample_list へのコントリビュートを歓迎します。開発にコントリビュートしたい場合や問題を報告したい場合は、次のガイドラインに従ってください：

1. リポジトリをフォークします。

2. 機能またはバグ修正用の新しいブランチを作成します。

3. 変更を加え、説明が入っているメッセージをコミットします。

4. 変更内容をフォークにプッシュします。

5. メインリポジトリにプルリクエストを送信します。

## ライセンス

sample_list は [MIT](LICENSE) の下でライセンスされています。

sample_list を選んでいただきありがとうございます！問題が発生した場合や改善の提案がある場合は、お気軽に [問題を作成](https://github.com/tomgly/sample_list/issues) するか、 [プロジェクトにコントリビュート](#contributing) してください。フィードバックと協力をお待ちしています。