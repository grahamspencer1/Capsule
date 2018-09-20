require 'test_helper'

class EntryTest < ActiveSupport::TestCase

  def setup
    @user = User.create(name: "Test", email: "test@test.com", password: "testtest", password_confirmation: "testtest")
    @bg_picture = BgPicture.create(mood: 'happy')
  end

  def test_user_can_save_entry
    entry = Entry.create(title: "Test", content: "Lorem Ipsum", private: true, bg_picture_id: @bg_picture.id, user_id: @user.id, created_at: false, updated_at: false, mood: "happy", auto_mood: false)
    entry.save
    assert entry.valid?
  end

  def user_cannot_save_entry_with_empty_fields
    entry = Entry.create(title: "")
    refute entry.valid?
  end

  def test_entry_cannot_be_less_than_3_characters
    entry = Entry.create(content: "1")
    refute entry.valid?
  end

  def test_entry_cannot_be_more_than_1500_characters
    entry = Entry.create(content: "This block of text is more than 1500 characters long. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare massa eget egestas purus viverra accumsan. Magna eget est lorem ipsum dolor sit amet. Urna porttitor rhoncus dolor purus non enim praesent elementum facilisis. Ullamcorper eget nulla facilisi etiam dignissim diam quis enim lobortis. Adipiscing tristique risus nec feugiat in. Et tortor at risus viverra adipiscing at in tellus integer. Erat pellentesque adipiscing commodo elit at imperdiet. Dui faucibus in ornare quam. Ac odio tempor orci dapibus ultrices in iaculis nunc sed. Enim diam vulputate ut pharetra sit amet. In ante metus dictum at tempor commodo ullamcorper a lacus. Enim praesent elementum facilisis leo vel. A iaculis at erat pellentesque adipiscing commodo elit. Condimentum vitae sapien pellentesque habitant morbi tristique senectus et netus. Nunc scelerisque viverra mauris in aliquam sem fringilla ut. Fringilla ut morbi tincidunt augue interdum velit euismod in. Enim facilisis gravida neque convallis a cras semper auctor. Sit amet mauris commodo quis imperdiet. Turpis nunc eget lorem dolor sed viverra ipsum nunc aliquet. Blandit turpis cursus in hac habitasse platea dictumst quisque. Vitae proin sagittis nisl rhoncus mattis rhoncus urna. Sit amet consectetur adipiscing elit. In ante metus dictum at tempor commodo ullamcorper a lacus. Enim praesent elementum facilisis leo vel. A iaculis at erat pellentesque adipiscing commodo elit.")
    refute entry.valid?
  end

end
