require! {
  assert
  moment
  chai: { expect }
  leshdash: { head, rpad, lazy, union, assign, omit, map, curry, times, keys, first, wait, head }
  '../index.ls': Range
}



describe 'Range', ->
  before ->
    @range = new Range moment(), moment().add(30,'days')
    
  specify 'child', ->
    console.log @range.format( 'YYYY-MM-DD' )
    console.log @range.zoomIn(2).format('YYYY-MM-DD')
    
