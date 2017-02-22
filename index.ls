#autocompile
require! {
  leshdash: { assign, zipWith }
  moment
  'moment-range': Range
}

assign Range::, do
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
    
    new Range zipWith do
      [ updateStart, updateEnd or updateStart ]
      [ @start, @end ]
      
      (cb, m) -> cb m.clone!

  duration: -> moment.duration @diff!
  
module.exports = Range
