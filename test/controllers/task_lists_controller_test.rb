require 'test_helper'

class TaskListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get task_lists_index_url
    assert_response :success
  end

end
