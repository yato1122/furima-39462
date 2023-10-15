require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context '新規登録ができる時' do
    it '正しい情報が入力されている場合、登録できる' do
      expect(@user).to be_valid
    end
  end

  context '新規登録ができない時' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailが一意性でないと登録できない' do
      existing_user = FactoryBot.create(:user, email: 'test@example.com')
      @user.email = 'test@example.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailに@を含まないと登録できない' do
      @user.email = 'testexample.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'パスワードが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードが6文字未満では登録できない' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードが半角英数字混合でないと登録できない' do
      @user.password = 'password'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password must include at least one letter and one digit')
    end

    it 'パスワードと確認用パスワードが一致しないと登録できない' do
      @user.password = 'password1'
      @user.password_confirmation = 'password2'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '英字のみのパスワードでは登録できない' do
      @user.password = 'password'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password must include at least one letter and one digit')
    end

    it '数字のみのパスワードでは登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password must include at least one letter and one digit')
    end

    it '全角文字を含むパスワードでは登録できない' do
      @user.password = 'パスワード123'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password must include at least one letter and one digit')
    end

    it '名字が空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it '名前が空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it '姓（全角）に半角文字が含まれていると登録できない' do
      @user.last_name = 'Yamada1' # 例: 姓に半角文字を含む
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end
    it '名（全角）に半角文字が含まれていると登録できない' do
      @user.first_name = 'Taro2' # 例: 名に半角文字を含む
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it '名字カタカナが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it '名前カタカナが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'お名前(全角)が全角漢字/ひらがな/カタカナでないと登録できない' do
      @user.first_name = 'Smith'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it 'お名前カナ(全角)が全角カタカナでないと登録できない' do
      @user.first_name_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end

    it '姓（カナ）にカタカナ以外の文字が含まれていると登録できない' do
      @user.last_name_kana = '山田たろう' # 例: 姓（カナ）にカタカナ以外の文字を含む
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end

    it '名（カナ）にカタカナ以外の文字が含まれていると登録できない' do
      @user.first_name_kana = 'たろうYamada' # 例: 名（カナ）にカタカナ以外の文字を含む
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it '生年月日が空だと登録できない' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
