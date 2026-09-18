pragma Ada_2022;

package body Workers is

   task body Echo is
      Buffer : String (1 .. 256) := (others => ' ');
      Last   : Natural := 0;
   begin
      accept Send (Msg : String) do
         Last := Natural'Min (Msg'Length, Buffer'Length);
         Buffer (1 .. Last) := Msg (Msg'First .. Msg'First + Last - 1);
      end Send;

      accept Receive (Msg : out String; Len : out Natural) do
         Len := Last;
         Msg (Msg'First .. Msg'First + Last - 1) := Buffer (1 .. Last);
      end Receive;
   end Echo;

   procedure Run_Parallel
     (Shared : in out Counter_PO.Counter;
      Count  : Positive;
      N      : Positive)
   is
      task type Inc_Worker is
         entry Go;
         entry Done;
      end Inc_Worker;

      task body Inc_Worker is
      begin
         accept Go;
         for I in 1 .. N loop
            Shared.Increment;
         end loop;
         accept Done;
      end Inc_Worker;

      type Team is array (1 .. Count) of Inc_Worker;
      W : Team;
   begin
      for T of W loop
         T.Go;
      end loop;
      for T of W loop
         T.Done;
      end loop;
   end Run_Parallel;

end Workers;
