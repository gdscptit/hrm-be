# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context 'email' do
      let(:invalid_email_params) { { email: 'test', password: 'test_password', password_confirmation: 'test_password' } }
      let(:invalid_email_params_2) { { email: 'test@', password: 'test_password', password_confirmation: 'test_password' } }
      let(:invalid_email_params_3) { { email: 'test@.dev', password: 'test_password', password_confirmation: 'test_password' } }
      let(:normal_params) { { email: 'test@example.com', password: 'test_password', password_confirmation: 'test_password' } }

      it 'wrong email format' do
        expect do
          User.create!(invalid_email_params)
        end.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'wrong email format (email still have @ symbol)' do
        expect do
          User.create!(invalid_email_params_2)
        end.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'wrong email format (email still have @ symbol but only last domain name)' do
        expect do
          User.create!(invalid_email_params_3)
        end.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'success validation' do
        expect do
          User.create!(normal_params)
        end.not_to raise_error
      end
    end

    context 'password' do
      let(:invalid_password_confirmation) { { email: 'test@example.com', password: 'test_password', password_confirmation: 'wrong_password_confirmation' } }
      let(:invalid_password_confirmation_2) { { email: 'test@example.com', password: 'test', password_confirmation: 'test' } }
      let(:normal_params) { { email: 'test@example.com', password: 'test1234', password_confirmation: 'test1234' } }

      it 'wrong confirmation' do
        expect do
          User.create!(invalid_password_confirmation)
        end.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'success confirmation but password has length lower than 6' do
        expect do
          User.create!(invalid_password_confirmation_2)
        end.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'success validation' do
        expect do
          User.create!(normal_params)
        end.not_to raise_error
      end
    end
  end
end
