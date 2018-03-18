require 'rails_helper'

RSpec.describe User, type: :model, focus:true do

  describe "Factories" do
    context "Non-admin user" do
      it "has a valid factory" do
        # Using the shortened version of FactoryBot syntax.
        # Add:  "config.include FactoryBot::Syntax::Methods" (no quotes) to your spec_helper.rb
        expect(build(:user)).to be_valid
      end
    end

    context "Admin user" do
      it "has a valid factory" do
        expect(build(:admin)).to be_valid
      end

      it "is a user" do
        expect(build(:admin)).to be_an_instance_of(User)
      end
    end
  end

  let(:general_user) { build(:user) }
  let(:admin_user) { build(:admin) }

  describe "Admin status" do
    after { User.last.destroy }

    it "is false by default" do
      user = create(:user)
      expect(User.last[:admin]).to eql(false)
    end
  end

  describe "ActiveModel validations", focus:false do
    # http://guides.rubyonrails.org/active_record_validations.html
    # http://rubydoc.info/github/thoughtbot/shoulda-matchers/master/frames
    # http://rubydoc.info/github/thoughtbot/shoulda-matchers/master/Shoulda/Matchers/ActiveModel

    # Basic validations
    it { expect(general_user).to validate_presence_of(:email) }
    it { expect(general_user).to validate_presence_of(:password) }
    it { expect(general_user).to validate_uniqueness_of(:email).case_insensitive}

    # Format validations
    it { expect(general_user).to allow_value("a@a").for(:email) }
    it { expect(general_user).to_not allow_value("aba").for(:email) }

    # Inclusion/acceptance of values
    it { expect(general_user).to validate_length_of(:password).is_at_least(6) }
    it { expect(general_user).to validate_length_of(:password).is_at_most(20) }
  end

  # context "callbacks" do
  #   # http://guides.rubyonrails.org/active_record_callbacks.html
  #   # https://github.com/beatrichartz/shoulda-callback-matchers/wiki

  #   let(:user) { create(:user) }

  #   it { expect(user).to callback(:send_welcome_email).after(:create) }
  #   it { expect(user).to callback(:track_new_user_signup).after(:create) }
  #   it { expect(user).to callback(:make_email_validation_ready!).before(:validation).on(:create) }
  #   it { expect(user).to callback(:calculate_some_metrics).after(:save) }
  #   it { expect(user).to callback(:update_user_count).before(:destroy) }
  #   it { expect(user).to callback(:send_goodbye_email).before(:destroy) }
  # end

  # describe "public instance methods" do
  #   context "responds to its methods" do
  #     it { expect(factory_instance).to respond_to(:public_method_name) }
  #     it { expect(factory_instance).to respond_to(:public_method_name) }
  #   end

  #   context "executes methods correctly" do
  #     context "#method name" do
  #       it "does what it's supposed to..."
  #         expect(factory_instance.method_to_test).to eq(value_you_expect)
  #       end

  #       it "does what it's supposed to..."
  #         expect(factory_instance.method_to_test).to eq(value_you_expect)
  #       end
  #     end
  #   end
  # end

  # describe "public class methods" do
  #   context "responds to its methods" do
  #     it { expect(factory_instance).to respond_to(:public_method_name) }
  #     it { expect(factory_instance).to respond_to(:public_method_name) }
  #   end

  #   context "executes methods correctly" do
  #     context "self.method name" do
  #       it "does what it's supposed to..."
  #         expect(factory_instance.method_to_test).to eq(value_you_expect)
  #       end
  #     end
  #   end
  # end

end
