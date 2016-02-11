require 'fileutils'
require_relative '../../bin/ruby/toge'

RSpec.describe Toge do
  SETTINGS_YAML = File.join(__dir__, '../../conf/settings.yaml')
  TMP_YAML = File.join(__dir__, '../../tmp/tmp.yaml')

  let(:first_date) { '2016-02-16' }
  let(:last_date) { '2016-02-20' }
  let(:data) do
    { 'date': { 'first_date': first_date, 'last_date': last_date } }
  end

  before do
    FileUtils.cp(SETTINGS_YAML, TMP_YAML)

    settings = File.open(SETTINGS_YAML, 'w')
    YAML::dump(data, settings)
    settings.close
  end

  after do
    FileUtils.mv(TMP_YAML, SETTINGS_YAML)
  end

  describe '#first_date_string' do
    context '異常系' do
      context 'first_dateが設定されていない場合' do
        let(:data) do
          { 'date': { 'last_date': last_date } }
        end
        it 'first_dateがnilであること' do
          expect(Toge.first_date_string).to eq nil
        end
      end
      context 'first_dateが設定されていない場合' do
        let(:data) do
          { 'test': 'test' }
        end
        it 'exceptionが発生すること' do
          expect { Toge.first_date_string }.to raise_error(NoMethodError)
        end
      end
    end
    context '正常系' do
      context 'first_dateが設定されている場合' do
        it 'first_dateが取得できること' do
          expect(Toge.first_date_string).to eq first_date
        end
      end
    end
  end

  describe '#last_date_string' do
    context '異常系' do
      context 'last_dateが設定されていない場合' do
        let(:data) do
          { 'date': { 'first_date': first_date } }
        end
        it 'last_dateがnilであること' do
          expect(Toge.last_date_string).to eq nil
        end
      end
      context 'last_dateが設定されていない場合' do
        let(:data) do
          { 'test': 'test' }
        end
        it 'exceptionが発生すること' do
          expect { Toge.last_date_string }.to raise_error(NoMethodError)
        end
      end
    end
    context '正常系' do
      context 'last_dateが設定されている場合' do
        it 'last_dateが取得できること' do
          expect(Toge.last_date_string).to eq last_date
        end
      end
    end
  end
end
