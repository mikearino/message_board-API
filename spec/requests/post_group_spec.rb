require 'rails_helper'

describe "post a group route", :type => :request do

  before do
    post '/groups', params: { :topic => 'test_topic' }
  end

  it 'returns the topic name' do
    expect(JSON.parse(response.body)['topic']).to eq('test_topic')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end
