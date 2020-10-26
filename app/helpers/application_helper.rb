module ApplicationHelper
    #Autores
    require 'redcarpet/render_strip'

    #pode passar as permissões para cada tipo de role, desde que tenha a definição do role no ability.rb
    def has_role?(role)
        current_user && current_user.has_role?(role)
    end
    

    class CodeRayify < Redcarpet::Render::HTML
        def block_code(code, language)
            CodeRay.scan(code, language).div
        end
    end

    def markdown(text)
        coderayified = CodeRayify.new(:filter_html => true, :hard_wrap => true)
        options = {
            fenced_code_blocks: true,
            no_intra_emphasis: true,
            autolink: true,
            lax_html_blocks: true
        }
        markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
        markdown_to_html.render(text).html_safe
    end

    def strip_markdown(text)
        markdown_to_plain_text = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
        markdown_to_plain_text.render(text).html_safe
    end


    #Carrinho
    def cart_count_over_one
        if @cart.line_items.count > 0
            return "<span class='tag is-dark'> #{@cart.line_items.count}</span>".html_safe
        end
    end

    def cart_has_items
        return @cart.line_items.count > 0
    end
    
end
