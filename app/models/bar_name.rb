class BarName < ActiveRecord::Base
  has_many :menus

  def make_name
    name ||= percent_chance?(50) ? "The #{street}" : "#{street} & #{street}"
  end

  private

    def street
      pull_word_from(:streets)
    end

    def data
      File.open("static_data.yml", "r") { |f| YAML.load(f) }.symbolize_keys
    end

    def percent_chance?(num)
      num > rand(0..100)
    end

    def pull_word_from(key)
      data[key].sample
    end

end
