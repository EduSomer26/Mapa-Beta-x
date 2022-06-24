using CairoMakie

function beta_x(N, b)
    eixoy=Vector{Float64}()
    eixox=Vector{Float64}()
    i = 0
    x = 0.1
    while i < N
        x = b*x
        while x >1
            x = x - 1
        end
        append!(eixox, i)
        append!(eixoy, x)
        i = i+1
    end

        plote = Plots.plot(xlabel="N", ylabel="x(β)",
            grid=false,
            dpi=1000,
            )

        Plots.plot!(eixox,eixoy,
            dpi = 1000,
            label = "x(β)",
            color=:black,
            linesize = 0.1)

        Plots.plot!([0.0,0],[0.0,0.0],
            label = "β = 2.81",
            l = :dash, lc = :white,
            dpi=1000)

        Plots.png(plote,
            string("LyapunovSpectrum1"))
end

N = 1000
b = 2.81
beta_x(N,b)
