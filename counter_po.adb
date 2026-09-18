pragma Ada_2022;

package body Counter_PO is

   protected body Counter is

      procedure Increment is
      begin
         Count := Count + 1;
      end Increment;

      procedure Reset is
      begin
         Count := 0;
      end Reset;

      function Value return Natural is
      begin
         return Count;
      end Value;

   end Counter;

end Counter_PO;
