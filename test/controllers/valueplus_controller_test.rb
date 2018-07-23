require 'test_helper'

class ValueplusControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get donate" do
    get :donate
    assert_response :success
  end

  test "should get match" do
    get :match
    assert_response :success
  end

  test "should get check" do
    get :check
    assert_response :success
  end

  test "should get myCareer" do
    get :myCareer
    assert_response :success
  end

  test "should get myDonate" do
    get :myDonate
    assert_response :success
  end

  test "should get myScrap" do
    get :myScrap
    assert_response :success
  end

  test "should get myAssembly" do
    get :myAssembly
    assert_response :success
  end

  test "should get profileEdit" do
    get :profileEdit
    assert_response :success
  end

  test "should get list" do
    get :list
    assert_response :success
  end

end
