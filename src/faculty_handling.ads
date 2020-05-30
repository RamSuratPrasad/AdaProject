with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

package faculty_handling is

   type faculty is record
         Name : Unbounded_String;
         EmpId : Integer; --in range of Positive <>
         Department : Unbounded_String;
         JoiningDate : Unbounded_String;
         Gender : Unbounded_String;
         Age : Integer;
   end record;
   
   procedure AddFaculty;
   procedure DisplayFaculty(Department : Unbounded_String := To_Unbounded_String(""));
   function CheckFaculty(f : faculty) return Boolean;
   procedure TransferFaculty(EmpId : Integer; ToDept : Unbounded_String);
   procedure DeleteFaculty(EmpId : Integer);
   procedure FormattedDisplay (f : faculty);

end faculty_handling;
