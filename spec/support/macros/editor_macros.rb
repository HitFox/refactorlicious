module EditorMacros
  def get_editor_value
    page.driver.evaluate_script("editor.getValue();")
  end

  def set_editor_value(value)
    page.driver.execute_script("editor.setValue('#{value}');")
  end
end
