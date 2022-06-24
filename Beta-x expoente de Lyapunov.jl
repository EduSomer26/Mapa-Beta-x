import Plots

function betax(N)
    b = 0
    eixoy=Vector{Float64}()
    eixox=Vector{Float64}()
    eixoz=Vector{Float64}()

    while b <=2
        append!(eixox, b)
        x = 0.1
        i = 0
        while i < N
            x = x * b
            while x > 1
                x = x -1
            end
            i = i + 1
        end
        lyap = log(abs(b))
        append!(eixoz, x)
        append!(eixoy, lyap)
        b = b + 0.000001
    end

    plote = Plots.plot(xlabel="β",
        legend = false,
        grid=false,
        dpi=1000,
        )

    Plots.plot!(eixox,eixoy,
        dpi = 1000,
        label = "Lyapunov exponent",
        color=:black)

    "Plots.plot!(eixox,eixoz,
        dpi = 1000,
        label = x(β),
        seriestype = :scatter,
        markersize = 0.01,
        color=:blue)"

    Plots.plot!([0.0,2.0],[0.0,0.0],
        label = "λ = 0",
        l = :dash, lc = :deepskyblue3,
        dpi=1000)

    Plots.png(plote,
        string("LyapunovSpectrum1"))
end

N = 1000
betax(N)
