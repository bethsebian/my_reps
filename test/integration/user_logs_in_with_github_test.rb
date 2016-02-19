require "test_helper"

class UserLogsInWithGithubTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    Capybara.app = MyReps::Application
    stub_omniauth
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      "provider"=>"github",
      "uid"=>"12345677",
      "info"=> {
        "nickname"=>"janedoe",
        "email"=>"janedoe@example.com",
        "name"=>"Jane Doe",
        "urls"=> {
          "GitHub"=>"https://github.com/janedoe", "Blog"=>nil
        }
      },
      "credentials"=>{
        "token"=>"1298743987639487634", "expires"=>false
      },
      "extra"=>{
        "raw_info"=>{
          "login"=>"janedoe",
          "id"=>12345678,
          "name"=>"Jane Doe",
        }
      }
    })
  end

  test "logging in" do
    visit "/"
    assert_equal 200, page.status_code
    click_link "Login with Github"
    assert_equal '/dashboard', current_path
    assert page.has_content?("Representatives Working for You")
    assert page.has_link?("Log Out")
  end
end