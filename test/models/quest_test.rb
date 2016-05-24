require 'test_helper'

class QuestTest < ActiveSupport::TestCase

  def setup
    @quest = Quest.new(name: "Quest Teste", description: "Qualquer descrição", experience_points: 100)
  end

  test "setup should be valid " do
    assert @quest.valid?
  end

  test "name should be present" do
    @quest.name = " "
    assert_not @quest.valid?
  end

  test "description should be present " do
    @quest.description = " "
    assert_not @quest.valid?
  end

  test "experience_points should be present" do
    @quest.experience_points = nil
    assert_not @quest.valid?
  end

  test "description should be unique " do
    duplicate_quest = @quest.dup
    duplicate_quest.description = @quest.description
    @quest.save
    assert_not duplicate_quest.valid?
  end

  test "name should be unique" do
    duplicate_quest = @quest.dup
    duplicate_quest.name = @quest.name
    @quest.save
    assert_not duplicate_quest.valid?
  end


end
