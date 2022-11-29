=begin
require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest

    test 'should create a new category' do
        get new_category_path
        assert_response :success
        assert_difference 'User.count', 1 do
            post: create_category_path, params: {category: {name: 'School'}}
            assert_response :redirect
        end
        follow_redirect!
        assert_response :success
    end
end
=end