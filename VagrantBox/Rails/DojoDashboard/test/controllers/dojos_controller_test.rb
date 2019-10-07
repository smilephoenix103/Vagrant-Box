require 'test_helper'

class DojosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dojos_index_url
    assert_response :success
  end

  test "should get new" do
    get dojos_new_url
    assert_response :success
  end

  test "should get show" do
    get dojos_show_url
    assert_response :success
  end

  test "should get edit" do
    get dojos_edit_url
    assert_response :success
  end

end
