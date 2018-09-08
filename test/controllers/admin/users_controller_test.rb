require "test_helper"

describe Admin::UsersController do
  it "should get index" do
    get admin_users_index_url
    value(response).must_be :success?
  end

end
