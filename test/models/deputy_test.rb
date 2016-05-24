require 'test_helper'

class DeputyTest < ActiveSupport::TestCase

  def setup
    @deputy = Deputy.new(name: "Deputado Teste",registration: 12345,
     legislation_situation: "teste", gender:"Feminino", age: 45)
  end

  test "setup should be valid" do
    assert @deputy.valid?
  end

  test "name should be present" do
    @deputy.name = " "
    assert_not @deputy.valid?
  end

  test "registration should be present " do
    @deputy.registration = nil
    assert_not @deputy.valid?
  end

  test "registration should be unique" do
    duplicate_deputy = @deputy.dup
    duplicate_deputy.registration = @deputy.registration
    @deputy.save
    assert_not duplicate_deputy.valid?
  end

  test "legislation_situation should be present" do
    @deputy.legislation_situation = nil
    assert_not @deputy.valid?
  end

  test "gender should be present" do
    @deputy.gender = nil
    assert_not @deputy.valid?
  end

  test "age should be present" do
    @deputy.age = nil
    assert_not @deputy.valid?
  end



end
