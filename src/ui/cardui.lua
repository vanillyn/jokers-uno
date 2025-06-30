local CardUI = {
    renderers = {}
}

function CardUI.registerRenderer(typeName, renderer)
    CardUI.renderers[typeName] = renderer
end

function CardUI.draw(pile)
    local renderer = CardUI.renderers[pile.__type]
    if renderer and renderer.draw then
        renderer.draw(pile)
    end
end

function CardUI.mousepressed(x, y)

end

return CardUI
