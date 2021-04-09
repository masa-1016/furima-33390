# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| nickname  | string | null: false |
| name      | string | null: false |
| name_kana | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| birthday  | string | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| name        | string | null: false |
| explanation | string | null: false |
| category    | string | null: false |
| condition   | string | null: false |
| postage     | string | null: false |
| area        | string | null: false |
| time        | string | null: false |
| price       | string | null: false |

### Association

- belongs_to :users
- has_one :buys

## buys

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| card_num    | string | null: false |
| expiration  | string | null: false |
| code        | string | null: false |
| postal      | string | null: false |
| prefecture  | string | null: false |
| city        | string | null: false |
| address     | string | null: false |
| building    | string |             |
| telephone   | string | null: false |

### Association

- belongs_to :users
- belongs_to :items

