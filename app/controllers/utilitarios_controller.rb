class UtilitariosController < ApplicationController

    def calculadora
        @result = 0
        @value = 0

        if !params[:a].nil?
            @value = params[:a]
        end

        if !params[:operation].nil?
            @result = self.send(params[:operation], *[params[:a], params[:b]])
        end
        render :calculadora
    end

    def conversor
        @result = 0
        @value = 0

        if !params[:a].nil?
            @value = params[:a]
        end

        if !params[:operation].nil?
            @result = self.send(params[:operation], *[params[:a]])
        end
        render :conversor
    end

    private
        # Calculadora

        def sum(a = 0, b = 0)
            a.to_f + b.to_f
        end
    
        def subtr(a = 0, b = 0)
            a.to_f - b.to_f
        end

        def multp(a = 0, b = 0)
            a.to_f * b.to_f
        end

        def div(a = 0, b = 0)
            a.to_f / b.to_f
        end

        # Conversor de unidades

        def tofah(a = 0)
            separate_comma((a.to_f * 1.8) + 32).to_s + ' °F'
        end

        def tocel(a = 0)
            separate_comma((a.to_f - 32) * (0.55555555555555555)).to_s + ' °C'
        end

        def todop(a = 0)
            'RD$' + separate_comma(a.to_f * 58.50).to_s
        end

        def tousd(a = 0)
            'USD$' + separate_comma(a.to_f / 58.50).to_s
        end

        def separate_comma(number)
            whole, decimal = number.to_s.split(".")
            whole_with_commas = whole.chars.to_a.reverse.each_slice(3).map(&:join).join(",").reverse
            [whole_with_commas, decimal].compact.join(".")
        end
end
