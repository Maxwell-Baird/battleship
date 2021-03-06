require './lib/cell'
require './lib/ship'

class Board

  attr_reader :cells

  def initialize
    @cells ={
      'A1' => Cell.new('A1'),
      'A2' => Cell.new('A2'),
      'A3' => Cell.new('A3'),
      'A4' => Cell.new('A4'),
      'B1' => Cell.new('B1'),
      'B2' => Cell.new('B2'),
      'B3' => Cell.new('B3'),
      'B4' => Cell.new('B4'),
      'C1' => Cell.new('C1'),
      'C2' => Cell.new('C2'),
      'C3' => Cell.new('C3'),
      'C4' => Cell.new('C4'),
      'D1' => Cell.new('D1'),
      'D2' => Cell.new('D2'),
      'D3' => Cell.new('D3'),
      'D4' => Cell.new('D4')
    }
  end


  def valid_coordinate?(cell_parameter)
    check = false
    if cell_parameter.length == 2
      letter_cap = cell_parameter.capitalize
      if @cells.has_key?(letter_cap)
        check = true
      end
    end
    check
  end

  def place(ship_parameter, ship_placement_array)
    ship_placement_array.each do |cell_name|
      @cells[cell_name].place_ship(ship_parameter)
    end
  end

  def valid_placement?(ship_parameter, ship_placement_array)
    check_r = placement_in_a_row?(ship_parameter, ship_placement_array)
    check_l = placement_equal_to_length?(ship_placement_array, ship_parameter)
    check_e = placement_not_empty?(ship_placement_array)
    check_r && check_e && check_l
  end

  def placement_in_a_row?(ship_parameter, ship_placement_array)
    check = false
    placement_array = ['A1B1C1D1','A2B2C2D2','A3B3C3D3',
    'A4B4C4D4','A1A2A3A4','B1B2B3B4','C1C2C3C4','D1D2D3D4']
    ship_string = ship_placement_array.join
    placement_array.each do |row|
      if row.include?(ship_string)
        check = true
      end
    end
    check
  end

  def placement_equal_to_length?(ship_placement_array, ship_parameter)
    if ship_placement_array.length != ship_parameter.length
      false
    else
      true
    end
  end

  def placement_not_empty?(ship_placement_array)
    check = true
    @cells.each_key do |cell_name|
      ship_placement_array.each do |ship_cell|
        if @cells[cell_name].empty?  == false && @cells[cell_name].coordinate == ship_cell
          check = false
        end
      end
    end
    check
  end

  def render(view = false)
    board_render = []
    i = 16
    board_render << "  1 2 3 4"
    board_render << "\nA"
    cells.each do |cell_name, cell|
      i -= 1
      if i == 12
        board_render << cell.render(view)
        board_render << "\nB"
      elsif i == 8
        board_render << cell.render(view)
        board_render << "\nC"
      elsif i == 4
        board_render << cell.render(view)
        board_render << "\nD"
      elsif i == 0
        board_render << cell.render(view)
        board_render << "\n"
      else
        board_render << cell.render(view)
      end
    end
    puts board_render.join(' ')
    board_render.join(' ')
  end
end
