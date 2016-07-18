require 'rails_helper'

RSpec.describe Category, type: :model, focus:true do

  it "has a valid factory" do
    expect(build(:category)).to be_valid
  end

  let(:category) { build(:category) }

  describe "ActiveModel validations", focus:false do
    it { expect(category).to validate_presence_of(:name) }
    it { expect(category).to validate_length_of(:name).is_at_most(30) }
  end

  describe "ActiveRecord associations" do
    # Associations
    it { expect(category).to have_many(:category_entries).dependent(:destroy) }
    it { expect(category).to have_many(:photos).through(:category_entries) }
    # it { expect(initech_corporation).to have_many(:employees).with_foreign_key(:worker_drone_id) }
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

  # describe "scopes" do
  #   # It's a good idea to create specs that test a failing result for each scope, but that's up to you
  #   it ".loved returns all votes with a score > 0" do
  #     product = create(:product)
  #     love_vote = create(:vote, score: 1, product_id: product.id)
  #     expect(Vote.loved.first).to eq(love_vote)
  #   end

  #   it "has another scope that works" do
  #     expect(model.scope_name(conditions)).to eq(result_expected)
  #   end
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
