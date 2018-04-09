require 'test_helper'

class WeaponControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get weapon_index_url
    assert_response :success
  end

  test "should get create" do
    get weapon_create_url
    assert_response :success
  end

  test "should get update" do
    get weapon_update_url
    assert_response :success
  end

  test "should get destroy" do
    get weapon_destroy_url
    assert_response :success
  end

end
