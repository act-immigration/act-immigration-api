require "test_helper"

class EnquiriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enquiry = enquiries(:one)
  end

  test "should get index" do
    get enquiries_url, as: :json
    assert_response :success
  end

  test "should create enquiry" do
    assert_difference("Enquiry.count") do
      post enquiries_url,
           params: { enquiry: { dob: @enquiry.dob,
                                elaborate: @enquiry.elaborate,
                                email: @enquiry.email,
                                entry_date: @enquiry.entry_date,
                                gender: @enquiry.gender,
                                immigration_status: @enquiry.immigration_status,
                                marital_status: @enquiry.marital_status,
                                name: @enquiry.name,
                                passport_number: @enquiry.passport_number,
                                phonenumber: @enquiry.phonenumber,
                                reference_number: @enquiry.reference_number,
                                residential_address: @enquiry.residential_address,
                                service_type: @enquiry.service_type, surname: @enquiry.surname } }, as: :json
    end

    assert_response :created
  end

  test "should show enquiry" do
    get enquiry_url(@enquiry), as: :json
    assert_response :success
  end

  test "should update enquiry" do
    patch enquiry_url(@enquiry),
          params: { enquiry: { dob: @enquiry.dob,
                               elaborate: @enquiry.elaborate,
                               email: @enquiry.email,
                               entry_date: @enquiry.entry_date,
                               gender: @enquiry.gender,
                               immigration_status: @enquiry.immigration_status,
                               marital_status: @enquiry.marital_status,
                               name: @enquiry.name,
                               passport_number: @enquiry.passport_number,
                               phonenumber: @enquiry.phonenumber,
                               reference_number: @enquiry.reference_number,
                               residential_address: @enquiry.residential_address,
                               service_type: @enquiry.service_type,
                               surname: @enquiry.surname } }, as: :json
    assert_response :success
  end

  test "should destroy enquiry" do
    assert_difference("Enquiry.count", -1) do
      delete enquiry_url(@enquiry), as: :json
    end

    assert_response :no_content
  end
end
