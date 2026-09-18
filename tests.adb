pragma Ada_2022;

with Ada.Assertions; use Ada.Assertions;
with Ada.Text_IO; use Ada.Text_IO;
with Counter_PO;
with Workers;

procedure Tests is
   C : Counter_PO.Counter;
   E : Workers.Echo;
   Buf : String (1 .. 64) := (others => ' ');
   Len : Natural;
begin
   Assert (C.Value = 0);
   C.Increment;
   C.Increment;
   Assert (C.Value = 2);
   C.Reset;
   Assert (C.Value = 0);
   Put_Line ("PASS protected Counter");

   E.Send ("hello");
   E.Receive (Buf, Len);
   Assert (Len = 5);
   Assert (Buf (1 .. 5) = "hello");
   Put_Line ("PASS task rendezvous Echo");

   C.Reset;
   Workers.Run_Parallel (C, Count => 4, N => 100);
   Assert (C.Value = 400);
   Put_Line ("PASS parallel tasks + protected Increment");

   Put_Line ("All Tasking Basics topic tests passed.");
end Tests;
