
using PlusHC, Test, LinearAlgebra

x = 1 + im
A = randn(ComplexF64, 100, 100)

@test x + hc == 2real(x)
@test A + hc ≈ A + A'
@test ishermitian(A + hc)
@test (A + hc) + hc ≈ 2(A + hc)
