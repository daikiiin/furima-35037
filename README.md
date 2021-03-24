# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false              |
| family_name        | string | null: false              | 
| first_name         | string | null: false              |
| family_name_kana   | string | null: false              |
| first_name_kana    | string | null: false              |
| birth_day          | date   | null: false              |

### Association

- has_many : purchases
- has_many : items
- has_one  : order

## items テーブル

| Column                      | Type    | Options     |
| --------------------------- | ------  | ----------- |
| name                        | string  | null: false |
| explain                     | text    | null: false | 
| category_id                 | integer | null: false |
| item_status_id              | integer | null: false |
| shipping_fee_status_id      | integer | null: false |
| shipping_fee_destination_id | integer | null: false |
| shipping_fee_day_id         | integer | null: false |
| cost                        | integer | null: false |
| user                        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## orders テーブル

| Column                         | Type    | Options     |
| ------------------------------ | ------- | ----------- |
| post_code                      | string  | null: false |
| shipping_fee_destination_id    | integer | null: false |
| city                           | string  | null: false |
| address                        | string  | null: false |
| building_name                  | string  |
| phone_number                   | string  | null: false |
### Association

- belongs_to :purchase
- belongs_to :user


## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :item