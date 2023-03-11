# frozen_string_literal: true

# rubocop:disable Layout/LineLength
class Template
  def self.show_carriage(train)
    train.carriages_info do |carriage, i|
      puts "\t\tВагон: ##{i}, тип: #{carriage.type}, занято: #{carriage.filled_units} у.е., свободно: #{carriage.max_units} у.е."
    end
  end
end
# rubocop:enable Layout/LineLength
