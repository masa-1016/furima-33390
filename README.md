# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| -----------------  | ------ | ----------- |
| nickname           | string | null: false |
| last_name          | string | null: false |
| last_name_kana     | string | null: false |
| first_name         | string | null: false |
| first_name_kana    | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :histories

## items テーブル

| Column       | Type    | Options           |
| ------------ | ------- | ----------------- |
| name         | string  | null: false       |
| explanation  | text    | null: false       |
| category_id  | string  | null: false       |
| condition_id | string  | null: false       |
| postage_id   | string  | null: false       |
| area_id      | string  | null: false       |
| time_id      | integer | foreign_key: true |
| price        | string  | null: false       |

### Association

- belongs_to :user
- has_one :histories

## histories

| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :addresses

## addresses

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal        | string     | null: false                    |
| prefecture_id | integer    | foreign_key: true              |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| telephone     | string     | null: false                    |
| history       | references | null: false, foreign_key: true |

### Association

- belongs_to :history



