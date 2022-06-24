import Plots

function betax(N)
    b = 0
    eixoy=Vector{Float64}()
    eixox=Vector{Float64}()
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
        append!(eixoy, x)
        b = b + 0.000001
    end

    plote = Plots.plot(ylim = (0,1),
        xlabel="β", ylabel = "x(β)",
        grid=false,
        legend=false,
        dpi=1000)

    Plots.plot!(eixox,eixoy,
    dpi = 1000,
    seriestype = :scatter,
    markersize = 0.1,
    color=:black)

    Plots.png(plote,
        string("Betax"))
end

N = 1000
betax(N)
