using Base.Test

@testset "AlphaGo" begin
  include("test_go.jl")
  include("test_mcts.jl")
  include("test_mcts_player.jl")
  include("test_features.jl")
end
