# Encoding: utf-8
require 'spec_helper'

describe 'yum-jpackage::default' do
  let(:chef_run) do
    ChefSpec::Runner.new(
      :platform => 'centos',
      :version => '6.5'
      ) do |node|
        node.set[:yum][:jpackage][:managed] = true
      end.converge('yum-jpackage::default')
  end

  it "creates yum_repository[#{repo}]" do
    expect(chef_run).to create_yum_repository(repo)
  end

end
