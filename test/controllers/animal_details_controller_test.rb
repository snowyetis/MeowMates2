require 'test_helper'

class AnimalDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @animal_detail = animal_details(:one)
  end

  test "should get index" do
    get animal_details_url
    assert_response :success
  end

  test "should get new" do
    get new_animal_detail_url
    assert_response :success
  end

  test "should create animal_detail" do
    assert_difference('AnimalDetail.count') do
      post animal_details_url, params: { animal_detail: {  } }
    end

    assert_redirected_to animal_detail_url(AnimalDetail.last)
  end

  test "should show animal_detail" do
    get animal_detail_url(@animal_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_animal_detail_url(@animal_detail)
    assert_response :success
  end

  test "should update animal_detail" do
    patch animal_detail_url(@animal_detail), params: { animal_detail: {  } }
    assert_redirected_to animal_detail_url(@animal_detail)
  end

  test "should destroy animal_detail" do
    assert_difference('AnimalDetail.count', -1) do
      delete animal_detail_url(@animal_detail)
    end

    assert_redirected_to animal_details_url
  end
end
