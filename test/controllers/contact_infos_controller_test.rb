require "test_helper"

class ContactInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact_info = contact_infos(:one)
  end

  test "should get index" do
    get contact_infos_url, as: :json
    assert_response :success
  end

  test "should create contact_info" do
    assert_difference("ContactInfo.count") do
      post contact_infos_url, params: { contact_info: { email: @contact_info.email, name: @contact_info.name, phonenumber: @contact_info.phonenumber, surname: @contact_info.surname } }, as: :json
    end

    assert_response :created
  end

  test "should show contact_info" do
    get contact_info_url(@contact_info), as: :json
    assert_response :success
  end

  test "should update contact_info" do
    patch contact_info_url(@contact_info),
          params: { contact_info: { email: @contact_info.email, name: @contact_info.name, phonenumber: @contact_info.phonenumber, surname: @contact_info.surname } }, as: :json
    assert_response :success
  end

  test "should destroy contact_info" do
    assert_difference("ContactInfo.count", -1) do
      delete contact_info_url(@contact_info), as: :json
    end

    assert_response :no_content
  end
end
