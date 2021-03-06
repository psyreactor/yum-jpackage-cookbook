# Encoding: utf-8
require 'spec_helper'

describe 'yum-jpackage::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(
      :platform => 'centos',
      :version => '6.5'
      ) do |node|
        node.set[:yum][:jpackage][:managed] = true
      end.converge('yum-jpackage::default')
  end

  it 'creates yum_repository jpackage' do
    expect(chef_run).to create_yum_repository('jpackage')
  end

end
