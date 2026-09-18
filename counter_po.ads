--  Ada 2022 topic: protected object for synchronized shared state.
pragma Ada_2022;

package Counter_PO is

   protected type Counter is
      procedure Increment;
      procedure Reset;
      function Value return Natural;
   private
      Count : Natural := 0;
   end Counter;

end Counter_PO;
