require 'pry'
require_relative '../lib/loader.rb'
require_relative '../lib/item.rb'

class ItemRepository
  attr_accessor :items
  def initialize(filename='./data/item.csv')
    @loader = Loader.new
    loaded_csvs = @loader.load_csv(filename)
    @items = populate_items(loaded_csvs)
  end

  def add_item(record)
    Item.new(record)
  end

  def populate_items(loaded_csvs)
    items = {}
    loaded_csvs.each do |item|
      id = item.first
      record = item.last
      items[id] = add_item(record)
    end
    items
  end

end