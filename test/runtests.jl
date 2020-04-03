
using Conjugates, Test, LinearAlgebra

x = 1 + im
A = randn(ComplexF64, 100, 100)

@test x + hc == 2real(x)
@test A + hc ≈ A + A'
@test ishermitian(A + hc)
@test (A + hc) + hc ≈ 2(A + hc)
@test A*hc ≈ A*A'

@test x + tp == 2x
@test A + tp ≈ A + transpose(A)
@test isymmetric(A + tp)
@test (real(A) + tp) + tp ≈ 2(real(A) + tp)
@test A*tp ≈ A*transpose(A)
