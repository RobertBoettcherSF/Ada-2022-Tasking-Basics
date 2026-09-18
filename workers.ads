--  Task type with entries (rendezvous) plus a parallel increment helper.
pragma Ada_2022;

with Counter_PO;

package Workers is

   task type Echo is
      entry Send (Msg : String);
      entry Receive (Msg : out String; Len : out Natural);
   end Echo;

   --  Count tasks each call Shared.Increment N times; wait until all finish.
   procedure Run_Parallel
     (Shared : in out Counter_PO.Counter;
      Count  : Positive;
      N      : Positive);

end Workers;
