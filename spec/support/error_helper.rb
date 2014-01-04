module ErrorHelper

  def expect_presence_error_for(type, attribute)
    within ".input.#{type}_#{attribute.to_s}" do
      expect(page).to have_content "can't be blank"
    end
  end

end
