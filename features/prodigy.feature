Feature: Prodigy

  Scenario: Prodigy mode
    Given I start prodigy
    Then I should be in prodigy mode

  Scenario: Prodigy buffer
    Given I start prodigy
    Then I should be in buffer "*prodigy*"
    And the buffer should be read only

  Scenario: Mode hook
    Given I load the following:
      """
      (add-hook 'prodigy-mode-hook
          (lambda () (setq foo "bar")))
      """
    Then the variable "foo" should be undefined
    When I start prodigy
    Then the variable "foo" should have value "bar"
