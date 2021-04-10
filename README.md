# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| last_name       | string | null: false |
| last_name_kana  | string | null: false |
| first_name      | string | null: false |
| first_name_kana | string | null: false |
| name_kana       | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| birthday        | string | null: false |

### Association

- has_many :items
- has_many :histories

## items テーブル

| Column      | Type     | Options     |
| ----------- | -------- | ----------- |
| name        | string   | null: false |
| explanation | text     | null: false |
| category    | string   | null: false |
| condition   | string   | null: false |
| postage     | string   | null: false |
| area        | string   | null: false |
| time        | datetime | null: false |
| price       | string   | null: false |

### Association

- belongs_to :users
- has_one :histories

## histories

| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :addresses

## addresses

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| postal      | string | null: false |
| prefecture  | string | null: false |
| city        | string | null: false |
| address     | string | null: false |
| building    | string |             |
| telephone   | string | null: false |

### Association

- belongs_to :histories



