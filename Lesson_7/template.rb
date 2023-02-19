class Templates
  def self.show_carriage(train)
    train.get_carriages do |carriage, i|
      puts "\t\tВагон: ##{i}, тип: #{carriage.type}, занято: #{carriage.units} у.е., свободно: #{carriage.max_units}у.е."
    end
  end
end