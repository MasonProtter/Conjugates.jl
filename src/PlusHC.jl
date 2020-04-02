module PlusHC

using LinearAlgebra

struct HC end
const hc = HC() #hermitian conjugate

Base.:(+)(x, ::HC) = x + x'
Base.:(+)(x::Number, ::HC) = 2real(x)
Base.:(+)(x::Hermitian, ::HC) = 2x
Base.:(+)(x::AbstractMatrix, ::HC) = Hermitian(x + x')

export hc

end # module
