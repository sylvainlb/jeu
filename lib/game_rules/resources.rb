module Resources

  RESOURCES = YAML.load_file('lib/game_rules/resources.yml')

  def volume
    RESOURCES[resource_type][volume]
  end

  def ingredients
    RESOURCES[resource_type][ingredients]
  end

end