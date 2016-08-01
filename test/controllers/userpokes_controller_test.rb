require 'test_helper'

class UserpokesControllerTest < ActionController::TestCase
  setup do
    @userpoke = userpokes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:userpokes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create userpoke" do
    assert_difference('Userpoke.count') do
      post :create, userpoke: { pokemon_id: @userpoke.pokemon_id, user_id: @userpoke.user_id }
    end

    assert_redirected_to userpoke_path(assigns(:userpoke))
  end

  test "should show userpoke" do
    get :show, id: @userpoke
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @userpoke
    assert_response :success
  end

  test "should update userpoke" do
    patch :update, id: @userpoke, userpoke: { pokemon_id: @userpoke.pokemon_id, user_id: @userpoke.user_id }
    assert_redirected_to userpoke_path(assigns(:userpoke))
  end

  test "should destroy userpoke" do
    assert_difference('Userpoke.count', -1) do
      delete :destroy, id: @userpoke
    end

    assert_redirected_to userpokes_path
  end
end
