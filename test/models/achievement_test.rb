require 'test_helper'

class AchievementTest < ActiveSupport::TestCase

  def setup
    @achievement = Achievement.new(name: "Achievement Teste", description: "Qualquer descrição", experience_points: 100)
  end

  test "setup should be valid " do
    assert @achievement.valid?
  end

  test "name should be present" do
    @achievement.name = " "
    assert_not @achievement.valid?
  end

  test "description should be present " do
    @achievement.description = " "
    assert_not @achievement.valid?
  end

  test "experience_points should be present" do
    @achievement.experience_points = nil
    assert_not @achievement.valid?
  end

  test "description should be unique " do
    duplicate_achievement = @achievement.dup
    duplicate_achievement.description = @achievement.description
    @achievement.save
    assert_not duplicate_achievement.valid?
  end

  test "name should be unique" do
    duplicate_achievement = @achievement.dup
    duplicate_achievement.name = @achievement.name
    @achievement.save
    assert_not duplicate_achievement.valid?
  end





end
