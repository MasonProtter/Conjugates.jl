module Conjugates

using LinearAlgebra: LinearAlgebra, Symmetric, Hermitian

struct HC end
const hc = HC()

struct TP end
const tp = TP()

Base.:(+)(x, ::HC) = x + x'
Base.:(+)(x::Union{Real, Complex}, ::HC) = 2real(x)
Base.:(+)(x::Hermitian, ::HC) = 2x
Base.:(+)(x::AbstractMatrix, ::HC) = Hermitian(x + x')

Base.:(-)(x, ::HC) = x - x'
Base.:(-)(x::Number, ::HC) = 2imag(x)

Base.:(*)(x, ::HC) = x * x'
Base.:(*)(x::Complex, ::HC) = real(x)^2 + imag(x)^2
Base.:(*)(x::Hermitian, ::HC) = x^2
Base.:(*)(x::AbstractMatrix, ::HC) = Hermitian(x * x')


Base.:(+)(x, ::TP) = x + transpose(x)
Base.:(+)(x::Number, ::TP) = 2x
Base.:(+)(x::Symmetric, ::TP) = 2x
Base.:(+)(x::AbstractMatrix, ::TP) = Symmetric(x + x')

Base.:(-)(x, ::TP) = x - transpose(x)
Base.:(-)(x::Number, ::TP) = zero(x)

Base.:(*)(x, ::TP) = x * transpose(x)
Base.:(*)(x::Symmetric, ::TP) = x^2
Base.:(*)(x::AbstractMatrix, ::TP) = Symmetric(x * x')

export hc, tp

end
