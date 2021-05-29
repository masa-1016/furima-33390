require 'rails_helper'

RSpec.describe ChargeForm, type: :model do
  before do
    @charge_form = FactoryBot.build(:charge_form)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it "全ての項目が入力させていれば購入ができること" do
        expect(@charge_form).to be_valid
      end
    end
  
    context '商品購入がうまくいかないとき' do
      it "tokenが空では登録できないこと" do
        @charge_form.token = nil
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include("Token can't be blank")
      end

      it "郵便番号が空では保存ができないこと" do
        @charge_form.postal = nil
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include("Postal can't be blank")
      end
      it "郵便番号に『-』が含まれないと保存ができないこと" do
        @charge_form.postal = 1231234
        #binding.pry
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include("Postal is invalid")
      end
      it "住所が空では保存ができないこと" do
        @charge_form.postal = nil
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include("Postal can't be blank")
      end
      it "都道府県が空では保存ができないこと" do
        @charge_form.area_id = nil
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include("Area is not a number")
      end
      it "市区町村が空では保存ができないこと" do
        @charge_form.city = nil
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空では保存ができないこと" do
        @charge_form.address = nil
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空では保存ができないこと" do
        @charge_form.telephone = nil
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include("Telephone can't be blank")
      end
      it "電話番号が12桁以上では保存ができないこと" do
        @charge_form.telephone = "123456789012"
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include("Telephone is invalid")
      end
      it "電話番号が9桁以下では保存ができないこと" do
        @charge_form.telephone = "123456789"
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include("Telephone is invalid")
      end
    end
  end
end