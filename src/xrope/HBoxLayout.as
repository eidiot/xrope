package xrope
{
    import flash.display.DisplayObjectContainer;
    /**
     * @author eidiot
     */
    public class HBoxLayout extends AbstractMultiLayoutGroup
    {
        //======================================================================
        //  Constructor
        //======================================================================
        public function HBoxLayout(container:DisplayObjectContainer,
                                   width:Number, height:Number,
                                   x:Number = 0, y:Number = 0,
                                   align:String = "TL",
                                   horizontalGap:Number = 5,
                                   verticalGap:Number = 5,
                                   autoLayoutWhenAdd:Boolean = false,
                                   autoLayoutWhenChange:Boolean = true)
        {
            super(container, width, height, x, y, align, horizontalGap, verticalGap, autoLayoutWhenAdd, autoLayoutWhenChange);
        }
        //======================================================================
        //  Overridden methods
        //======================================================================
        override protected function layoutElements():void
        {
            layoutAsLines("width", _horizontalGap);
        }
        override protected function createLine():ILayoutGroup
        {
            var line:HLineLayout = new HLineLayout(_container);
            line.align = _lineAlign;
            line.horizontalGap = _horizontalGap;
            return line;
        }
        override protected function createTopLayout():ILayoutGroup
        {
            return new VLineLayout(_container, _x, _y, _width, _height, _align, _verticalGap);
        }
    }
}