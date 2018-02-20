def eight_queens(row, taken, positions)
  positions ||= []

  return [positions] if row == 8
  all_pos = []
  left = (0..7).to_a - taken

  left. each do |col|
    dup_pos = positions.dup
    dup_pos << [row, col]

    all_pos += eight_queens(row + 1, taken << col, dup_pos)
  end

  all_pos
end
