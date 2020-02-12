require './lib/board'
require './lib/ship'
require './lib/cell'
require 'pry'

class Computer

  attr_reader :unfired

  def initialize
    @unfired = ['A1','A2','A3','A4','B1','B2','B3','B4','C1','C2','C3','C4','D1','D2','D3','D4']
  end

  def choose_location(ship_parameter)
    vert_or_horz_choice = ['v','h']
    vert_or_horz = vert_or_horz_choice.sample
    @location = ''
    @cells_location = []
    if ship_parameter.length == 2
      size_2(vert_or_horz)
    elsif ship_parameter.length == 3
      size_3(vert_or_horz)
    end
    @cells_location
  end

  def size_2(h_or_v)
    vert_or_horz = h_or_v
    if vert_or_horz == 'h'
      possible_locations_h_2 = ['A1','A2','A3','B1','B2','B3','C1','C2','C3','D1','D2','D3']
      @location = possible_locations_h_2.sample
      builder_letter = @location[0]
      builder_number = @location[1]
      2.times do
        holder = builder_letter + builder_number
        @cells_location << holder
        number = 1 + builder_number.to_i
        builder_number = number.to_s
      end
    elsif vert_or_horz == 'v'
      possible_locations_v_3 = ['A1','A2','A3','A4','B1','B2','B3','B4','C1','C2','C3','C4']
      @location = possible_locations_v_3.sample
      builder_letter = @location[0]
      builder_number = @location[1]
      2.times do
        holder = builder_letter + builder_number
        @cells_location << holder
        letter = builder_letter.next
        builder_letter = letter
      end
    end
  end

  def size_3(h_or_v)
    vert_or_horz = h_or_v
    if vert_or_horz == 'h'
      possible_locations_h_3 = ['A1','A2','B1','B2','C1','C2','D1','D2']
      @location = possible_locations_h_3.sample
      builder_letter = @location[0]
      builder_number = @location[1]
      3.times do
        holder = builder_letter + builder_number
        @cells_location << holder
        number = 1 + builder_number.to_i
        builder_number = number.to_s
      end
    elsif vert_or_horz == 'v'
      possible_locations_v_3 = ['A1','A2','A3','A4','B1','B2','B3','B4']
      @location = possible_locations_v_3.sample
      builder_letter = @location[0]
      builder_number = @location[1]
      3.times do
        holder = builder_letter + builder_number
        @cells_location << holder
        letter = builder_letter.next
        builder_letter = letter
      end
    end
  end

  def shot_at
    shot = @unfired.sample
    @unfired.delete(shot)
    shot
  end
end
