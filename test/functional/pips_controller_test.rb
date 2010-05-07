require File.dirname(__FILE__) + '/../test_helper' 

class PipsControllerTest < ActionController::TestCase
fixtures :users

   def setup
     @controller = CompaniesController.new
     @request = ActionController::TestRequest.new
     @response = ActionController::TestResponse.new
     login_as :cpow
   end
   
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pip" do
    assert_difference('Pip.count') do
      post :create, :pip => { }
    end

    assert_redirected_to pip_path(assigns(:pip))
  end

  test "should show pip" do
    get :show, :id => pips(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => pips(:one).to_param
    assert_response :success
  end

  test "should update pip" do
    put :update, :id => pips(:one).to_param, :pip => { }
    assert_redirected_to pip_path(assigns(:pip))
  end

  test "should destroy pip" do
    assert_difference('Pip.count', -1) do
      delete :destroy, :id => pips(:one).to_param
    end

    assert_redirected_to pips_path
  end
end
