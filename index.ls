#autocompile
require! {
  leshdash: { assign }
  moment
  'moment-range': Range
}

assign Range::, do
  test: -> 3
  
  zoomIn: (n, t) ->
    if not n then n = @diff! / 4
    @transform (.add n, t), (.subtract n, t)

  zoomOut: (n, t) ->
    if not n then n = @diff! / 4
    @transform (.subtract n, t), (.add n, t)

  back: (n, t) ->
    if not n then n = @diff! / 2
    @transform (.subtract n, t)
  
  forward: (n, t) ->
    if not n then n = @diff! / 2
    @transform (.add n, t)

  map: -> [ it(@start), it(@end) ]
  
  format: (format) -> @map (.format format)

  transform: (updateStart, updateEnd) ->
    if not updateEnd then updateEnd = updateStart
    new Range (updateStart @start.clone!), (updateEnd @end.clone!)
      

module.exports = Range
