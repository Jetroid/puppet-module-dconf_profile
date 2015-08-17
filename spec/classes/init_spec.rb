require 'spec_helper'
describe 'dconf_profile' do

  context 'with defaults for all parameters' do
    it { should contain_class('dconf_profile') }
  end
end
