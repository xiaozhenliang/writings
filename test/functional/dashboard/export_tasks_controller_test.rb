require 'test_helper'

class Dashboard::ExportTasksControllerTest < ActionController::TestCase
  def setup
    @space = create :user
    login_as @space
  end

  test "should create task" do
    assert_difference ["@space.export_tasks.count", "Sidekiq::Extensions::DelayedClass.jobs.size"] do
      post :create, :space_id => @space, :export_task => { :format => 'jekyll', :category_id => '' }
    end
  end
end