Feature: Generate an HTML document

  Scenario: When no file is provided
    When I run "markyboot preview"
    Then the output should contain "No file"

  Scenario: When a Markdown file is provided
    When I run "markyboot preview ../../spec/example.md"
    Then the output should contain "opened in browser"

