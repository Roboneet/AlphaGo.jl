_KGS_COLUMNS = "ABCDEFGHJKLMNOPQRST"
_SGF_COLUMNS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

to_flat(c) = N * (c[2] - 1) + c[1]

from_flat(f) = tuple([i + 1 for i in reverse(divrem(f - 1, N))...])

function from_sgf(sgfc)
  # Interprets coords. aa is top left corner; sa is top right corner
  if sgfc == nothing || sgfc == ""
    return nothing
  end
  return searchindex(_SGF_COLUMNS, sgfc[2]), searchindex(_SGF_COLUMNS, sgfc[1])
end

# Converts from a board coordinate to an SGF coordinate
to_sgf(coord) =  coord ==  nothing ? "" : _SGF_COLUMNS[coord[2]] * _SGF_COLUMNS[coord[1]]

function from_kgs(kgsc)
  # Interprets coords. A1 is bottom left; A9 is top left.
  if kgsc == "pass"
    return nothing
  end
  kgsc = uppercase(kgsc)
  col = searchindex(_KGS_COLUMNS, kgsc[1])
  row_from_bottom = parse(Int, kgsc[2:end])
  return N - row_from_bottom + 1, col
end

# Converts from a board coordinate to a KGS coordinate.
to_kgs(coord) = coord == nothing ? "pass" : "$(_KGS_COLUMNS[coord[2]])$(N - coord[1] + 1)"
