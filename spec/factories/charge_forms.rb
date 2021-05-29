FactoryBot.define do
  factory :charge_form do
    token     {"tok_abcdefghijk00000000000000000"}
    postal    {"123-1234"}
    area_id   {2}
    city      {"横浜市緑区"}
    address   {"青山1-1-1"}
    building  {"柳ビル103"}
    telephone {"12345678900"}
  end
end