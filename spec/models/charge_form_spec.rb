require 'rails_helper'

RSpec.describe ChargeForm, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @charge_form = FactoryBot.build(:charge_form, item_id: @item.id, user_id: @user.id)
    sleep (1)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it "全ての項目が入力させていれば購入ができること" do
        expect(@charge_form).to be_valid
      end
      it "建物名は空でも購入ができること" do
        @charge_form.building = ""
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
        @charge_form.postal = "1231234"
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include("Postal is invalid")
      end
      it "住所が空では保存ができないこと" do
        @charge_form.postal = nil
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include("Postal can't be blank")
      end
      it "都道府県を選択しなければ保存ができないこと" do
        @charge_form.area_id = 1
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include("Area must be other than 1")
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
      it "電話番号が英数字混合では保存ができないこと" do
        @charge_form.telephone = "abcde12345"
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include("Telephone is invalid")
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
      it "user_idが空のでは保存できないこと" do
        @charge_form.user_id = nil
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空のでは保存できないこと" do
        @charge_form.item_id = nil
        @charge_form.valid?
        expect(@charge_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end